import { Neovim } from '@chemzqm/neovim'
import { CompleteOption, CompleteResult, ISource, SourceConfig, SourceType, VimCompleteItem } from '../types'
import { fuzzyChar } from '../util/fuzzy'
import { byteSlice } from '../util/string'
import workspace from '../workspace'
const logger = require('../util/logger')('model-source')

export default class Source implements ISource {
  public readonly name: string
  public readonly filepath: string
  public readonly sourceType: SourceType
  public readonly isSnippet: boolean
  protected readonly nvim: Neovim
  private _disabled = false
  private defaults: any
  constructor(option: Partial<SourceConfig>) {
    this.nvim = workspace.nvim
    // readonly properties
    this.name = option.name
    this.filepath = option.filepath || ''
    this.sourceType = option.sourceType || SourceType.Native
    this.isSnippet = !!option.isSnippet
    this.defaults = option
  }

  public get priority(): number {
    return this.getConfig('priority', 1)
  }

  public get triggerCharacters(): string[] {
    return this.getConfig('triggerCharacters', null)
  }

  // exists opitonnal function names for remote source
  public get optionalFns(): string[] {
    return this.getDefault('optionalFns', [])
  }

  public get triggerPatterns(): RegExp[] | null {
    let patterns = this.getConfig<any[]>('triggerPatterns', null)
    if (!patterns || patterns.length == 0) return null
    return patterns.map(s => {
      return (s instanceof RegExp) ? s : new RegExp(s + '$')
    })
  }

  public get shortcut(): string {
    let shortcut = this.getConfig('shortcut', '')
    return shortcut ? shortcut : this.name.slice(0, 3)
  }

  public get enable(): boolean {
    if (this._disabled) return false
    return this.getConfig('enable', true)
  }

  public get filetypes(): string[] | null {
    return this.getConfig('filetypes', null)
  }

  public get disableSyntaxes(): string[] {
    return this.getConfig('disableSyntaxes', [])
  }

  public getConfig<T>(key: string, defaultValue?: T): T | null {
    let config = workspace.getConfiguration(`coc.source.${this.name}`)
    return config.get(key, this.getDefault<T>(key, defaultValue))
  }

  private getDefault<T>(key: string, defaultValue?: T): T | null {
    let { defaults } = this
    if (defaults.hasOwnProperty(key)) return defaults[key]
    return defaultValue == undefined ? null : defaultValue
  }

  public toggle(): void {
    this._disabled = !this._disabled
  }

  public get firstMatch(): boolean {
    return this.getConfig('firstMatch', true)
  }

  public get menu(): string {
    let { shortcut } = this
    return `[${shortcut.toUpperCase()}]`
  }

  protected filterWords(words: string[], opt: CompleteOption): string[] {
    let res = []
    let { input } = opt
    let cword = opt.word
    if (!input.length) return []
    let cFirst = input[0]
    for (let word of words) {
      if (!word || word.length < 3) continue
      if (cFirst && !fuzzyChar(cFirst, word[0])) continue
      if (word == cword || word == input) continue
      res.push(word)
    }
    return res
  }

  /**
   * fix start column for new valid characters
   *
   * @protected
   * @param {CompleteOption} opt
   * @param {string[]} valids - valid charscters
   * @returns {number}
   */
  protected fixStartcol(opt: CompleteOption, valids: string[]): number {
    let { col, input, line, bufnr } = opt
    let start = byteSlice(line, 0, col)
    let document = workspace.getDocument(bufnr)
    if (!document) return col
    let { chars } = document
    for (let i = start.length - 1; i >= 0; i--) {
      let c = start[i]
      if (!chars.isKeywordChar(c) && valids.indexOf(c) === -1) {
        break
      }
      input = `${c}${input}`
      col = col - 1
    }
    opt.col = col
    opt.input = input
    return col
  }

  public async shouldComplete(opt: CompleteOption): Promise<boolean> {
    let { disableSyntaxes } = this
    let synname = opt.synname.toLowerCase()
    if (disableSyntaxes && disableSyntaxes.length && disableSyntaxes.findIndex(s => synname.indexOf(s.toLowerCase()) != -1) !== -1) {
      return false
    }
    let fn = this.getDefault<Function>('shouldComplete')
    if (fn) return await Promise.resolve(fn.call(this, opt))
    return true
  }

  public async refresh(): Promise<void> {
    let fn = this.getDefault<Function>('refresh')
    if (fn) await Promise.resolve(fn.call(this))
  }

  public async onCompleteDone(item: VimCompleteItem, opt: CompleteOption): Promise<void> {
    let fn = this.getDefault<Function>('onCompleteDone')
    if (fn) await Promise.resolve(fn.call(this, item, opt))
  }

  public async doComplete(opt: CompleteOption): Promise<CompleteResult | null> {
    let fn = this.getDefault<Function>('doComplete')
    if (fn) return await Promise.resolve(fn.call(this, opt))
    return null
  }
}
