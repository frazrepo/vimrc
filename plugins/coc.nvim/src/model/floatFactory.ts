import { Buffer, Neovim, Window } from '@chemzqm/neovim'
import { CancellationTokenSource, Disposable } from 'vscode-languageserver-protocol'
import events from '../events'
import snippetsManager from '../snippets/manager'
import { Documentation, Env } from '../types'
import { disposeAll } from '../util'
import { equals } from '../util/object'
import workspace from '../workspace'
import FloatBuffer from './floatBuffer'
import debounce from 'debounce'
const logger = require('../util/logger')('model-float')

export interface WindowConfig {
  width: number
  height: number
  col: number
  row: number
  relative: 'cursor' | 'win' | 'editor'
}

// factory class for floating window
export default class FloatFactory implements Disposable {
  private targetBufnr: number
  private window: Window
  private disposables: Disposable[] = []
  private floatBuffer: FloatBuffer
  private tokenSource: CancellationTokenSource
  private alignTop = false
  private createTs = 0
  private cursor: [number, number] = [0, 0]
  constructor(private nvim: Neovim,
    private env: Env,
    private preferTop = false,
    private maxHeight = 999,
    private maxWidth?: number) {
    if (!env.floating) return
    events.on('BufEnter', bufnr => {
      if (this.buffer && bufnr == this.buffer.id) return
      if (bufnr == this.targetBufnr) return
      this.close()
    }, null, this.disposables)
    events.on('InsertLeave', bufnr => {
      if (this.buffer && bufnr == this.buffer.id) return
      if (snippetsManager.isActived(bufnr)) return
      this.close()
    }, null, this.disposables)
    events.on('MenuPopupChanged', async (ev, cursorline) => {
      if (cursorline < ev.row && !this.alignTop) {
        this.close()
      } else if (cursorline > ev.row && this.alignTop) {
        this.close()
      }
    }, null, this.disposables)
    let onCursorMoved = debounce(this.onCursorMoved.bind(this), 100)
    events.on('CursorMovedI', onCursorMoved, this, this.disposables)
    events.on('CursorMoved', onCursorMoved, this, this.disposables)
  }

  private onCursorMoved(bufnr: number, cursor: [number, number]): void {
    if (!this.window) return
    if (this.buffer && bufnr == this.buffer.id) return
    if (bufnr == this.targetBufnr && equals(cursor, this.cursor)) return
    if (!workspace.insertMode || bufnr != this.targetBufnr) {
      this.close()
      return
    }
    let ts = Date.now()
    setTimeout(() => {
      if (this.createTs > ts) return
      this.close()
    }, 500)
  }

  private async checkFloatBuffer(): Promise<void> {
    let { floatBuffer } = this
    if (floatBuffer) {
      let valid = await floatBuffer.valid
      if (valid) return
    }
    let buf = await this.nvim.createNewBuffer(false, true)
    await buf.setOption('buftype', 'nofile')
    await buf.setOption('bufhidden', 'hide')
    this.floatBuffer = new FloatBuffer(buf, this.nvim)
  }

  private get columns(): number {
    return this.env.columns
  }

  private get lines(): number {
    return this.env.lines - this.env.cmdheight - 1
  }

  public async getBoundings(docs: Documentation[], offsetX = 0): Promise<WindowConfig> {
    let { nvim, preferTop } = this
    let { columns, lines } = this
    let alignTop = false
    let [row, col] = await nvim.call('coc#util#win_position') as [number, number]
    let maxWidth = this.maxWidth || Math.min(columns - 10, 82)
    let height = this.floatBuffer.getHeight(docs, maxWidth)
    height = Math.min(height, this.maxHeight)
    if (!preferTop) {
      if (lines - row < height && row > height) {
        alignTop = true
      }
    } else {
      if (row >= height || row >= lines - row) {
        alignTop = true
      }
    }
    if (alignTop) docs.reverse()
    await this.floatBuffer.setDocuments(docs, maxWidth)
    let { width } = this.floatBuffer
    offsetX = Math.min(col - 1, offsetX)
    if (col - offsetX + width > columns) {
      offsetX = col - offsetX + width - columns
    }
    this.alignTop = alignTop
    return {
      height: alignTop ? Math.min(row, height) : Math.min(height, (lines - row)),
      width: Math.min(columns, width),
      row: alignTop ? - height : 1,
      col: offsetX == 0 ? 0 : - offsetX,
      relative: 'cursor'
    }
  }

  public async create(docs: Documentation[], allowSelection = false, offsetX = 0): Promise<void> {
    if (!this.env.floating) return
    if (docs.length == 0) {
      this.close()
      return
    }
    if (this.tokenSource) {
      this.tokenSource.cancel()
    }
    this.createTs = Date.now()
    this.targetBufnr = workspace.bufnr
    let tokenSource = this.tokenSource = new CancellationTokenSource()
    let token = tokenSource.token
    await this.checkFloatBuffer()
    let config = await this.getBoundings(docs, offsetX)
    let [mode, line, col] = await this.nvim.eval('[mode(),line("."),col(".")]') as [string, number, number]
    this.cursor = [line, col]
    if (!config || token.isCancellationRequested) return
    allowSelection = mode == 's' && allowSelection
    if (token.isCancellationRequested) return
    if (['i', 'n', 'ic'].indexOf(mode) !== -1 || allowSelection) {
      let { nvim, alignTop } = this
      // change to normal
      if (mode == 's') await nvim.call('feedkeys', ['\x1b', 'in'])
      // helps to fix undo issue, don't know why.
      if (mode.startsWith('i')) await nvim.eval('feedkeys("\\<C-g>u")')
      let reuse = false
      if (this.window) reuse = await this.window.valid
      if (token.isCancellationRequested) return
      nvim.pauseNotification()
      if (!reuse) {
        nvim.notify('nvim_open_win', [this.buffer, true, config])
        nvim.command(`let w:float = 1`, true)
        nvim.command(`setl nospell nolist wrap linebreak foldcolumn=1`, true)
        nvim.command(`setl nonumber norelativenumber nocursorline nocursorcolumn`, true)
        nvim.command(`setl signcolumn=no conceallevel=2`, true)
        nvim.command(`setl winhl=Normal:CocFloating,NormalNC:CocFloating,FoldColumn:CocFloating`, true)
        nvim.command(`silent doautocmd User CocOpenFloat`, true)
      } else {
        this.window.setConfig(config, true)
        nvim.command(`noa call win_gotoid(${this.window.id})`, true)
      }
      this.floatBuffer.setLines()
      nvim.command(`normal! ${alignTop ? 'G' : 'gg'}0`, true)
      nvim.command('noa wincmd p', true)
      let [res, err] = await nvim.resumeNotification()
      if (err) {
        workspace.showMessage(`Error on ${err[0]}: ${err[1]} - ${err[2]}`, 'error')
        return
      }
      if (!reuse) this.window = res[0]
      if (mode == 's') await snippetsManager.selectCurrentPlaceholder(false)
    }
  }

  /**
   * Close float window
   */
  public close(): void {
    if (!this.env.floating) return
    if (this.tokenSource) {
      this.tokenSource.cancel()
      this.tokenSource = null
    }
    this.closeWindow(this.window)
  }

  private closeWindow(window: Window): void {
    if (!window) return
    this.nvim.call('coc#util#close_win', window.id, true)
    this.window = null
    let count = 0
    let interval = setInterval(() => {
      count++
      if (count == 5) clearInterval(interval)
      window.valid.then(valid => {
        if (valid) {
          this.nvim.call('coc#util#close_win', window.id, true)
        } else {
          clearInterval(interval)
        }
      }, _e => {
        clearInterval(interval)
      })
    }, 200)
  }

  public dispose(): void {
    if (this.tokenSource) {
      this.tokenSource.cancel()
    }
    disposeAll(this.disposables)
  }

  private get buffer(): Buffer {
    return this.floatBuffer ? this.floatBuffer.buffer : null
  }

  public async activated(): Promise<boolean> {
    if (!this.window) return false
    let valid = await this.window.valid
    return valid
  }
}
