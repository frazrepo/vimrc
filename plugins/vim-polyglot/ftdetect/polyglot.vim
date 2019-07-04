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

"Jenkinsfile
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'jenkins') == -1
  augroup filetypedetect
  " jenkins, from Jenkinsfile.vim in martinda/Jenkinsfile-vim-syntax
    " Jenkinsfile
    autocmd BufRead,BufNewFile Jenkinsfile set ft=Jenkinsfile
    autocmd BufRead,BufNewFile Jenkinsfile* setf Jenkinsfile
    autocmd BufRead,BufNewFile *.jenkinsfile set ft=Jenkinsfile
    autocmd BufRead,BufNewFile *.jenkinsfile setf Jenkinsfile
autocmd BufRead,BufNewFile *.Jenkinsfile setf Jenkinsfile
  augroup end
endif

"Terraform
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'terraform') == -1
  augroup filetypedetect
  " terraform, from terraform.vim in hashivim/vim-terraform
" By default, Vim associates .tf files with TinyFugue - tell it not to.
autocmd! filetypedetect BufRead,BufNewFile *.tf
autocmd BufRead,BufNewFile *.tf set filetype=terraform
autocmd BufRead,BufNewFile *.tfvars set filetype=terraform
autocmd BufRead,BufNewFile *.tfstate set filetype=json
autocmd BufRead,BufNewFile *.tfstate.backup set filetype=json
  augroup end
endif

"Ansible
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'ansible') == -1
  augroup filetypedetect
  " ansible, from ansible.vim in pearofducks/ansible-vim
function! s:isAnsible()
  let filepath = expand("%:p")
  let filename = expand("%:t")
  if filepath =~ '\v/(tasks|roles|handlers)/.*\.ya?ml$' | return 1 | en
  if filepath =~ '\v/(group|host)_vars/' | return 1 | en
  if filename =~ '\v(playbook|site|main|local)\.ya?ml$' | return 1 | en

  let shebang = getline(1)
  if shebang =~# '^#!.*/bin/env\s\+ansible-playbook\>' | return 1 | en
  if shebang =~# '^#!.*/bin/ansible-playbook\>' | return 1 | en

  return 0
endfunction

function! s:setupTemplate()
  if exists("g:ansible_template_syntaxes")
    let filepath = expand("%:p")
    for syntax_name in items(g:ansible_template_syntaxes)
      let s:syntax_string = '\v/'.syntax_name[0]
      if filepath =~ s:syntax_string
        execute 'set ft='.syntax_name[1].'.jinja2'
        return
      endif
    endfor
  endif
  set ft=jinja2
endfunction

augroup ansible_vim_ftyaml_ansible
    au!
    au BufNewFile,BufRead * if s:isAnsible() | set ft=yaml.ansible | en
augroup END
augroup ansible_vim_ftjinja2
    au!
    au BufNewFile,BufRead *.j2 call s:setupTemplate()
augroup END
augroup ansible_vim_fthosts
    au!
    au BufNewFile,BufRead hosts set ft=ansible_hosts
augroup END
  augroup end
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'ansible') == -1
  augroup filetypedetect
  " ansible, from ansible.vim in pearofducks/ansible-vim
function! s:isAnsible()
  let filepath = expand("%:p")
  let filename = expand("%:t")
  if filepath =~ '\v/(tasks|roles|handlers)/.*\.ya?ml$' | return 1 | en
  if filepath =~ '\v/(group|host)_vars/' | return 1 | en
  if filename =~ '\v(playbook|site|main|local)\.ya?ml$' | return 1 | en

  let shebang = getline(1)
  if shebang =~# '^#!.*/bin/env\s\+ansible-playbook\>' | return 1 | en
  if shebang =~# '^#!.*/bin/ansible-playbook\>' | return 1 | en

  return 0
endfunction

function! s:setupTemplate()
  if exists("g:ansible_template_syntaxes")
    let filepath = expand("%:p")
    for syntax_name in items(g:ansible_template_syntaxes)
      let s:syntax_string = '\v/'.syntax_name[0]
      if filepath =~ s:syntax_string
        execute 'set ft='.syntax_name[1].'.jinja2'
        return
      endif
    endfor
  endif
  set ft=jinja2
endfunction

augroup ansible_vim_ftyaml_ansible
    au!
    au BufNewFile,BufRead * if s:isAnsible() | set ft=yaml.ansible | en
augroup END
augroup ansible_vim_ftjinja2
    au!
    au BufNewFile,BufRead *.j2 call s:setupTemplate()
augroup END
augroup ansible_vim_fthosts
    au!
    au BufNewFile,BufRead hosts set ft=ansible_hosts
augroup END
  augroup end
endif


