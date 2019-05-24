"Init autocommand"
augroup filetypedetect
  autocmd!
augroup end

"DockerFile"
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'dockerfile') == -1
  augroup filetypedetect
      " dockerfile, from Dockerfile.vim in ekalinin/Dockerfile.vim
      " Dockerfile
      autocmd BufRead,BufNewFile Dockerfile set ft=Dockerfile
      autocmd BufRead,BufNewFile Dockerfile* set ft=Dockerfile
      autocmd BufRead,BufNewFile *.dock set ft=Dockerfile
      autocmd BufRead,BufNewFile *.[Dd]ockerfile set ft=Dockerfile
  augroup end
endif

"DockerFile"
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'dockerfile') == -1
  augroup filetypedetect
      " dockerfile, from docker-compose.vim in ekalinin/Dockerfile.vim
      " docker-compose.yml
      autocmd BufRead,BufNewFile docker-compose*.{yaml,yml}* set ft=yaml.docker-compose
  augroup end
endif

"Powershell"
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'powershell') == -1
  augroup filetypedetect
        " powershell, from ps1.vim in PProvost/vim-ps1
      " Vim ftdetect plugin file
      " Language:           Windows PowerShell
      " Maintainer:         Peter Provost <peter@provost.org>
      " Version:            2.10
      " Project Repository: https://github.com/PProvost/vim-ps1
      " Vim Script Page:    http://www.vim.org/scripts/script.php?script_id=1327
      "
      au BufNewFile,BufRead   *.ps1   set ft=ps1
      au BufNewFile,BufRead   *.psd1  set ft=ps1
      au BufNewFile,BufRead   *.psm1  set ft=ps1
      au BufNewFile,BufRead   *.pssc  set ft=ps1
  augroup end
endif

"Typescript"
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'typescript') == -1
  augroup filetypedetect
      " typescript, from typescript.vim in leafgarland/typescript-vim
      " use `set filetype` to override default filetype=xml for *.ts files
      autocmd BufNewFile,BufRead *.ts  set filetype=typescript
      " use `setfiletype` to not override any other plugins like ianks/vim-tsx
      autocmd BufNewFile,BufRead *.tsx setfiletype typescript
  augroup end
endif


"Smali"
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'smali') == -1
  augroup filetypedetect
      autocmd BufRead,BufNewfile *.smali set filetype=smali
  augroup end
endif

