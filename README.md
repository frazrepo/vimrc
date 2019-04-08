
## How to install for Linux ?

    1) git clone --depth=1 https://github.com/frazrepo/vimrc.git ~/.vim_runtime
    
    2) run ./install.sh

## How to install Windows ?

    1) git clone --depth=1 https://github.com/frazrepo/vimrc.git %USERPROFILE%/.vim_runtime
    
    2) run install.bat

## How to update to latest version?

Just do a git rebase!

    cd ~/.vim_runtime
    git pull --rebase

And run install.sh (or install.bat) to update vimrc configuration file

## Cheat Sheet

 - [Cheat Sheet for this vimrc](https://www.cheatography.com/fraz/cheat-sheets/vim-mappings/)
 - [Muscle Memory Cheat](https://www.cheatography.com/fraz/cheat-sheets/vim-muscle-memory/)

## Leader key

    leader = <space>

## Rotatable color schemes

    Default GUI : auy (light theme), dracula (dark theme)
    Default Terminal : apprentice (dark theme)
    Dark theme : anderson, atom-dark256, apprentice, codedark, minimalist, molokai, monokai(sublime text), nord, papercolor, seoul, space-vim-dark
    Light theme : ayu (dark available), seoul256-light, pencil

## Normal mode mappings

**General**

| Mapping           | Action                                 |
| ---               | ---                                    |
| \<leader>w        | Save buffer                            |
| :W                | Save as sudo (linux)                   |
| \<leader>fr       | Find/Replace highlighted text          |
| \<leader><leader> | noh                                    |
| \<leader>m        | Remove bad formatting ^M               |
| \<leader>f        | Search current buffer using Ilist                     |

**Move between Windows**

| Mapping | Action |
| ---     | ---    |
| \<C-h>  | Left   |
| \<C-l>  | Right  |

**Buffers**

| Mapping      | Action                         |
| ---          | ---                            |
| \<leader>bn  | New buffer                     |
| \<leader>bd  | Close buffer                   |
| \<leader>ba  | Close all buffers              |
| \<leader>bw  | Wipeout all hidden buffers     |
| \<bs>        | Navigate alternate buffer      |
| \<leader>h   | Navigate previous              |
| \<leader>l   | Navigate next                  |
| \<leader>x   | Scratch txt                    | 
| \<leader>d:  | Scratch Markdown               |
| \<leader>s   | Scratch SQL                    | 

**Tabs**

| Mapping       | Action                                |
| ---           | ---                                   |
| \<leader>tn   | New tab                               |
| \<leader>to   | Tab Only                              |
| \<leader>tc   | Close tab                             |
| \<leader>tm   | Move tab                              |
| \<leader>tl   | Alternate tab                         |
| \<leader>\<bs> | Alternate tab                         |
| \<leader>te   | Edit new tab in current buffer's path |

## Editing mappings

**Paste inner object quickly**

| Mapping | Action   |
| ---     | ---      |
| "p      | for vi"p |
| 'p      | for vi'p |
| (p      | for vi(p |
| )p      | for vi)p |
| ,p      | "0p      |

**Formatting**

| Mapping | Action                   |
| ---     | ---                      |
| g=      | Equalize entire document |
| gQ      | Format entire document   |

## Visual mode mappings
| Mapping    | Action                            |
| ---        | ---                               |
| *          | Search current selection          |
| #          | Search current selection backward |
| \<leader>r | Replace visual selection          |

## Command line mappings
| Mapping     | Action                            |
| ---         | ---                               |
| :W          |Write sudo                         |

## Various mappings
| Mapping    | Action                            |
| ---        | ---                               |
| F8         |Toggle quickfix window             |
| F10        |Rotate colorschemes                |
| F11        |Tagbar Toggle                      |
| F12        |Tag navigation                     |
| \<M-0>     |Set font bigger (gui only)         |
| \<M-9>     |Set font smaller (gui only)        |

## Plugins usage

**Emmet**

| Mapping          | Action                 | 
| ---              | ---                    |
| \,,              | Generate emmet         | 

**vim-lion**

| Mapping          | Action                 |
| ---              | ---                    |
| gl{to-m}=        | Right Align with =     |
| gL{to-m}=        | Left Align with =      |

**vim-abolish**

| Mapping   | Action               |
| ---       | ---                  |
| Subvert   | Search Command       |
| crs       | Coerce to snake_case |
| crm       | Coerce to MixedCase  |
| crc       | Coerce to CamelCase  |
| cru       | Coerce to UPPER_CASE |
| cr-       | Coerce to dash-case  |
| cr.       | Coerce to dot-case   |
| cr<space> | Coerce to space case |
| crt       | Coerce to Title Case |

**vim-exchange**

| Mapping       | Action                              |
| ---           | ---                                 |
| cx{to-motion} | Exchange with text object or motion |
| cxx           | Exchange lines                      |

**vim-operator-replace**

| Mapping       | Action                              |
| ---           | ---                                 |
| {"reg}gr{to-motion} |Paste register content on text object or motion|

**vim-sandwich with surroung mappings**

| Mapping     | Action                                      |
| ---         | ---                                         |
| cs"=        | Change surround                             |
| css"        | Change surround on line (detect surrouding) |
| ys{motion}" | Add surround                                |
| yss"        | Add surround on line                        |
| ds"         | Delete surround                             |
| dss         | Delete surround on line                     |
| S"          | Add surround on visual selection            |

**vim-gtfo**

| Mapping | Action                                    |
| ---     | ---                                       |
| gof     | Open current buffer directory             |
| got     | Open current buffer directory on terminal |

**nerdtree**

| Mapping     | Action                        |
| ---         | ---                           |
| \<leader>nn | Open current buffer directory |
| \<leader>nf | Open current buffer directory |

**vim-unimpaired**

| Mapping                          | Action                 |
| ---                              | ---                    |
| ( and )                          | Map keys               |
| (t, )t                           | Switch between tabs    |
| (b, )b                           | Switch between buffers |
| yo[r,n,w,x,....]                 | Toggle Options         |
| (space, )space, 10)space, (e, )e | Lines operations       |

**fzf**

| Mapping         | Action                        |
| ---             | ---                           |
| \<c-p>          | Files (t to open file in tab) |
| \<leader>bb     | Buffers                       |
| \<leader>u      | MRU                           |
| \<leader>t      | Tags                           |
| Ag select words | K                             |

**vim-rainbow**

| Mapping       | Action          |
| ---           | ---             |
| RainbowToogle | Toggle coloring |

**vim-rotatescheme**

| Mapping       | Action                  |
| ---           | ---                     |
| F10 / <S-F10> | Rotate Forward/Backward |

**vim-autoformat**

| Mapping                | Action                            |
| ---                    | ---                               |
| :Autoformat or F3      | Format entire buffer or selection |
| gq{motion} or {visual} | gq Formatting for sql                     |

**vim-signature**

| Mapping      | Action                   |
| ---          | ---                      |
| ma, mb, . .. | Add(Toggle) mark         |
| (' or )'     | Navigation between marks |
| m<space>     | Delete all marks         |

**vim-scripts/Tranpose**

| Mapping             | Action |
| ---                 | ---    |
| Tranpose            |        |
| TranposeWords       |        |
| TranposeTab         |        |
| TranposeCSV   ,     |        |
| TranposeInteractive |        |

**sort-motion**

| Mapping    | Action      |
| ---        | ---         |
| gs{motion} | gs3j, gsi(, |

**goyo and zenroom for markdown**

| Mapping   | Action   |
| ---       | ---      |
| <leader>z | Zen mode |

**ultisnips and vim-snippets**

| Mapping  | Action     |
| ---      | ---        |
| \<Tab>   | Expand |
| \<C-j>   | Jump forward |
| \<C-k>   | Jump backward |

**CtrlSF**

| Mapping   | Action                                   |
| ---       | ---                                      |
| \<leader>F| Find selected word                       |
| F9        | Toggle CtrlSF result Window              |
| \<C-f>f   | Prompt in command line to find a pattern |

**yankmatches**

| Mapping | Action                                           |
| ---     | ---                                              |
| ym / YM | Yank highlighted search lines  (YM for inverse)  |
| dm / DM | Delete highlighteed search line (DM for inverse) |

**zirrostig/vim-schlepp**

| Mapping            | Action                                                 |
| ---                | ---                                                    |
| up/down/left/right | After a selection in visual mode, drag using arrow key |

**vim-gutentags and tagbar**
| Mapping            | Action           |
| ---                | ---              |
| F11                |  Toogle tagBar   |

**custom text-objects**

| Mapping                    | Action     |
| ---                        | ---        |
| ciu, dau                   | Uri u      |
| ciq, daq                   | Quotes q   |
| vic, vac, viC, vaC         | Columns c  |
| cii, dai                   | Indents i  |
| cin(l)q, dai, ci,, ci=, .. | Targets    |
| cil, yil                   | Line l     |
| yie, cie                   | Entire e   |

**Miscellaneous Commands**

| Mapping       | Action                     |
| ---           | ---                        |
| ListLeaders   | Show all leader mappings   |
| VisualBlock   | Activate visual block mode |
| SortByWitdh   | Sort lines by width |

## Custom Docs

Regexp search/replace pattern

    :helptags fz-regexp
    :helptags fz-macro

## Plugins list

- [ack.vim](https://github.com/mileszs/ack.vim) : Search in files
- [ale](https://github.com/w0rp/ale) : Linter
- [auto-pairs](https://github.com/jiangmiao/auto-pairs) : () , {} ,[] , etc...
- [completor](https://github.com/maralla/completor.vim) : Manage auto completion correctly
- [ctrlsf.vim](https://github.com/dyng/ctrlsf.vim) : Side searching
- [emmet-vim](https://github.com/mattn/emmet-vim) : Html editing
- [fzf / fzf.vim](https://github.com/junegunn/fzf.vim)
- [goyo](https://github.com/junegunn/goyo.vim) : Dependency for zenroom2
- [LargeFile](http://www.vim.org/scripts/script.php?script_id=1506) : Handling large files
- [lightline](https://github.com/itchyny/lightline.vim) : Lightweight status line 
- [fzfmru](https://github.com/pbogut/fzf-mru.vim) : Browse most recent files
- [nerdtree](https://github.com/scrooloose/nerdtree) : File browser
- [utilsnips + vim-snippets](https://github.com/SirVer/ultisnips) : Snippets
- [vim-abolish](https://github.com/tpope/vim-abolish) : Search words, Coercion
- [vim-autoformat](https://github.com/Chiel92/vim-autoformat)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [* vim-cool](https://github.com/romainl/vim-cool) : Enhance hlsearch experience
- [* vim-exchange](https://github.com/tommcdo/vim-exchange) : Exchange in pair with a new operator cx
- [vim-fugitive](https://github.com/tpope/vim-fugitive) : Git command inside vim
- [vim-gtfo](https://github.com/justinmk/vim-gtfo) : Go to File Manager or Terminal
- [vim-gutentag](https://github.com/ludovicchabant/vim-gutentags) : Tag generation and nagivation
- [tagbar](https://github.com/majutsushi/tagbar) : Tagbar
- [vim-lion](https://github.com/tommcdo/vim-lion) : Align text (like tabular)
- [* vim-operator-user/vim-operator-replace](https://github.com/kana/vim-operator-replace) : Custom operators
- [vim-move](https://github.com/matze/vim-move) : Move lines or selections up and down using (ALT) jk keys
- [vim-obsession / vim-prosession](https://github.com/dhruvasagar/vim-prosession) : Autosave session
- [* vim-over](https://github.com/osyo-manga/vim-over) : Highlight buffer when operating from command line (s/, /, g/)
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) : Languages Support
- [vim-quickscope](https://github.com/unblevable/quick-scope) : Highlight potential candidates for inline searching with f or t
- [vim-qlist](https://github.com/romainl/vim-qlist) : Enhances ilist and dlist
- [vim-rainbow](https://github.com/luochen1990/rainbow) : Color parentheses, brackets,...
- [vim-repeat](https://github.com/tpope/vim-repeat) : To repeat plugin command with dot (.)
- [vim-rooter](https://github.com/airblade/vim-rooter) : Change dir to root project directory
- [vim-rotatescheme](https://github.com/frazrepo/vimrc/tree/master/plugins/vim-rotatescheme) : Custom plugin to rotate a list of colorschemes
- [vim-sandwich](https://github.com/machakann/vim-sandwich) : Surround texts with delimiters
- [vim-schlepp](https://github.com/zirrostig/vim-schlepp) : Drag selection in visual mode
- [vim-signature](https://github.com/kshenoy/vim-signature) : Display marks
- [vim-signify](https://github.com/mhinz/vim-signify) : Git status
- [vim-sort-motion](https://github.com/christoomey/vim-sort-motion) : Add an operator gs to apply sort
- [vim-textobj](https://github.com/kana/vim-textobj-user/wiki) | [targets.vim](https://github.com/wellle/targets.vim) : Some text objects -  uri (u), quotes (q), columns (c), indents (i), line (l), entire buffer (e)
- [vim-tranpose](https://github.com/salsifis/vim-transpose) : Tranpose lines, csv, words, ...
- [* vim-unimpaired](https://github.com/tpope/vim-unimpaired) :  Toogle Options, Next/Previous, Switch Lines or Add Spaces
- [vim-wipeout](https://github.com/artnez/vim-wipeout) : Close all hidden buffers
- [vim-zenroom2 (use goyo)](https://github.com/amix/vim-zenroom2) : Zen mode editing
- [yankmatches](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/yankmatches.vim) : Copy or Delete search results

[*] : A grade plugins, "sharpen the saw" philosophy
  
## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`

## Resources
* [Tim Pope's vimrc](https://github.com/tpope/tpope/blob/master/.vimrc)
* [Gary Bernhardt's vimrc](https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
* [Vincent Driessen's vimrc](https://github.com/nvie/vimrc/blob/master/vimrc)
* [Toran Billups's vimrc](https://github.com/toranb/dotfiles/blob/master/vimrc)
* [Damian Conway's vim setup](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup)
* [amix's vimrc](https://github.com/amix/vimrc)
* [vimrcfu](https://vimrcfu.com/)
