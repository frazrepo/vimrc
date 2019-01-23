"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       frazrepo
"       https://github.com/frazrepo/vimrc
" Custom abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab fzdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Header abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iab fzhead 
\<CR>"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
\<CR>" Maintainer: https//github.com/frazrepo
\<CR>" Date: <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
\<CR>" Description: 
\<CR>"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iab fzlic 
\<CR>// Copyright (c) 2018, github.com/frazrepo
\<CR>//
\<CR>// Licensed under the Apache License, Version 2.0 (the "License");
\<CR>// you may not use this file except in compliance with the License.
\<CR>// You may obtain a copy of the License at
\<CR>//
\<CR>//     http://www.apache.org/licenses/LICENSE-2.0
\<CR>//
\<CR>// Unless required by applicable law or agreed to in writing, software
\<CR>// distributed under the License is distributed on an "AS IS" BASIS,
\<CR>// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
\<CR>// See the License for the specific language governing permissions and
\<CR>// limitations under the License.