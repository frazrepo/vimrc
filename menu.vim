" Custom Tabs menu for managing tabs
function! Tabs_Menu()
    if has("menu") 
            let menuRoot     = 'Tabs'
            let menuPriority = exists("g:tabs_menu_priority") ? g:tabs_menu_priority : ''

            exec 'noremenu <script> '.menuPriority.' '.menuRoot.'.New<TAB>:tabnew :tabnew<CR>'
            exec 'noremenu  <script> '.menuPriority.' '.menuRoot.'.Close<TAB>:tabclose :close<CR>'
            exec 'noremenu <script> '.menuPriority.' '.menuRoot.'.Only<TAB>:tabonly :tabonly<CR>'
            exec 'noremenu <script> '.menuPriority.' '.menuRoot.'.Next<TAB>:tabnext :tabnext<CR>'
            exec 'noremenu  <script> '.menuPriority.' '.menuRoot.'.Previous<TAB>:tabprevious :tabprevious<CR>'
    endif
endfunction


call Tabs_Menu()
