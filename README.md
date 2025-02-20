# VIM Configuration

This repository hosts my vim configuration.

For neovim configuration, see here : https://github.com/frazrepo/nvim-config

## How to install on Linux ?
```shell
git clone --depth=1 https://github.com/frazrepo/vimrc.git ~/.vim_runtime
cd ~/.vim_runtime
./install.sh
```
## How to install on Windows ?
```shell
git clone --depth=1 https://github.com/frazrepo/vimrc.git %USERPROFILE%/.vim_runtime
cd %USERPROFILE%/.vim_runtime
install.bat

```

## How to update to latest version?

Just do a git rebase!

```shell
    cd ~/.vim_runtime
    git pull --rebase
```
And run install.sh (or install.bat) to update vimrc configuration file

## Cheat Sheet

 - [Cheat Sheet for this vimrc](https://www.cheatography.com/fraz/cheat-sheets/vim-mappings/)
 - [Muscle Memory Cheat](https://www.cheatography.com/fraz/cheat-sheets/vim-muscle-memory/)



## Mappings
<details>
    <summary>Click to expand</summary>

## Leader key

leader = <space>
    
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
| \<leader>bd or !  | Close buffer                   |
| \<leader>ba  | Close all buffers              |
| \<bs>        | Navigate alternate buffer      |
| \<leader>h   | Navigate previous              |
| \<leader>l   | Navigate next                  |
| \<leader>e   | Edit in current buffer's path                    | 
| \<leader>x   | Scratch txt                    | 
| \<leader>d:  | Scratch Markdown               |
| \<leader>s   | Scratch SQL                    | 

**Tabs**

| Mapping        | Action                                |
| ---            | ---                                   |
| \<leader>tn    | New tab                               |
| \<leader>to    | Tab Only                              |
| \<leader>tc    | Close tab                             |
| \<leader>\<bs> | Alternate tab                         |
| \<leader>te    | Edit new tab in current buffer's path |

## Editing mappings

**Paste inner object quickly**

| Mapping | Action   |
| ---     | ---      |
| \<leader>p      | "0p      |

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
| F3         |Neoformat                          |
| F4         |UndoTreeToggle                     |
| F8         |Toggle quickfix window             |
| F9         |Toggle CtrlSF                      |
| F10        |Rotate colorschemes                |
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

**ReplaceWithRegister**

| Mapping       | Action                              |
| ---           | ---                                 |
| {"reg}gr{to-motion} |Paste register content on text object or motion|
| {"reg}{motion}grr |Paste register content on lines|

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

**vim-unimpaired**

| Mapping                          | Action                 |
| ---                              | ---                    |
| ( and )                          | Map keys               |
| (t, )t                           | Switch between tabs    |
| (b, )b                           | Switch between buffers |
| yo[r,n,w,x,....]                 | Toggle Options         |
| (space, )space, 10)space, (e, )e | Lines operations       |

**LeaderF**

| Mapping         | Action                        |
| ---             | ---                           |
| \<c-p>          | Files (t to open file in tab) |
| \<leader>,     | Buffers                       |
| \<leader>;     | BLines                       |
| \<leader>u      | MRU                           |
| \<leader>co      | Commands                           |

**vim-rainbow**

| Mapping       | Action          |
| ---           | ---             |
| RainbowToggle | Toggle coloring |

**vim-rotatescheme**

| Mapping       | Action                  |
| ---           | ---                     |
| F10 / \<S-F10> | Rotate Forward/Backward |

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

**ultisnips and vim-snippets**

| Mapping  | Action        |
| ---      | ---           |
| \<Tab>   | Expand        |
| \<Tab>   | Jump forward  |
| \<S-Tab>   | Jump backward |

**CtrlSF**

| Mapping   | Action                                   |
| ---       | ---                                      |
| \<leader>*         | Find selected word                       |
| F9        | Toggle CtrlSF result Window              |
| \<leader>/| Prompt or Exec in Visual Mode |

**yankmatches**

| Mapping | Action                                           |
| ---     | ---                                              |
| ym / YM | Yank highlighted search lines  (YM for inverse)  |
| dm / DM | Delete highlighteed search line (DM for inverse) |

**zirrostig/vim-schlepp**

| Mapping            | Action                                                 |
| ---                | ---                                                    |
| up/down/left/right | After a selection in visual mode, drag using arrow key |
| D | Duplicate in Visual Mode|


**custom text-objects**

| Mapping                    | Action     |
| ---                        | ---        |
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
| WipeReg   | Clean all registers |
| RemoveTrailingSpaces | Remove spaces |  

</details>
    
## Custom Docs

Regexp search/replace pattern

    :h fztips
    :h fzvimtips

## Plugins list

- [completor](https://github.com/maralla/completor.vim) : Manage auto completion correctly
- [ctrlsf.vim](https://github.com/dyng/ctrlsf.vim) : Side searching
- [emmet-vim](https://github.com/mattn/emmet-vim) : Html editing
- [leaderF](https://github.com/Yggdroot/LeaderF) : Fuzzy finder
- [lightline](https://github.com/itchyny/lightline.vim) : Lightweight status line 
- [neoformat](https://github.com/sbdchd/neoformat): Various formatters for many languages
- [auto-pairs](https://github.com/jiangmiao/auto-pairs) : Auto close pairs (parentheses, quotes, ...)
- [utilsnips + vim-snippets](https://github.com/SirVer/ultisnips) : Snippets
- [vim-abolish](https://github.com/tpope/vim-abolish) : Search words, Coercion
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-nerdtree](https://github.com/preservim/nerdtree) : Tree Explorer
- [vim-exchange](https://github.com/tommcdo/vim-exchange) : Exchange in pair with a new operator cx
- [vim-fugitive](https://github.com/tpope/vim-fugitive) : Git command inside vim
- [vim-gtfo](https://github.com/justinmk/vim-gtfo) : Go to File Manager or Terminal
- [vim-lion](https://github.com/tommcdo/vim-lion) : Align text (like tabular)
- [ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister) : Custom operator gr to replace with register content
- [vim-move](https://github.com/matze/vim-move) : Move lines or selections up and down using (ALT) jk keys
- [vim-over](https://github.com/osyo-manga/vim-over) : Highlight buffer when operating from command line (s/, /, g/)
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) : Languages Support
- [vim-qlist](https://github.com/romainl/vim-qlist) : Enhances ilist and dlist
- [vim-qf](https://github.com/romainl/vim-qf) : Quickfix management, filtering,...
- [vim-rainbow](https://github.com/luochen1990/rainbow) : Color parentheses, brackets,...
- [vim-repeat](https://github.com/tpope/vim-repeat) : To repeat plugin command with dot (.)
- [vim-rooter](https://github.com/airblade/vim-rooter) : Change dir to root project directory
- [vim-rotatescheme](https://github.com/frazrepo/vimrc/tree/master/plugins/vim-rotatescheme) : Custom plugin to rotate a list of colorschemes
- [vim-sandwich](https://github.com/machakann/vim-sandwich) : Surround texts with delimiters
- [vim-sort-motion](https://github.com/christoomey/vim-sort-motion) : Add an operator gs to apply sort
- [targets.vim](https://github.com/wellle/targets.vim) : Some text objects - quotes (q), columns (c), indents (i), line (l), entire buffer (e)
- [vim-tranpose](https://github.com/salsifis/vim-transpose) : Tranpose lines, csv, words, ...
- [vim-unimpaired](https://github.com/tpope/vim-unimpaired) :  Toogle Options, Next/Previous, Switch Lines or Add Spaces
  
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
* [vimrcfu](https://vimrcfu.com/)
* [Debugging vim](https://codeinthehole.com/tips/debugging-vim-by-example/)
* [Another tips to debug vimrc](https://vimways.org/2018/debugging-your-vim-config/)
