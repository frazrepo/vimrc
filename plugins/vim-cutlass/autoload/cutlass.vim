
function! cutlass#overrideSelectBindings()
    let i = 33

    " Add a map for every printable character to copy to black hole register
    " I see no easier way to do this
    while i <= 126
        if i !=# 124
            let char = nr2char(i)
            if i ==# 92
              let char = '\\'
            endif
            exec 'snoremap '. char .' <c-o>"_c'. char
        endif

        let i = i + 1
    endwhile

    snoremap <bs> <c-o>"_c
    snoremap <space> <c-o>"_c<space>
    snoremap \| <c-o>"_c|
endfunction

function! cutlass#hasMapping(mapping, mode)
    return maparg(a:mapping, a:mode) != ''
endfunction

function! cutlass#addWeakMapping(left, right, modes, ...)
    let recursive = a:0 > 0 ? a:1 : 0

    for mode in split(a:modes, '\zs')
        if !cutlass#hasMapping(a:left, mode)
            exec mode . (recursive ? "map" : "noremap") . " <silent> " . a:left . " " . a:right
        endif
    endfor
endfunction

function! cutlass#getVersion()
    return "1.0"
endfunction

function! cutlass#overrideDeleteAndChangeBindings()
    let bindings =
    \ [
    \   ['c', '"_c', 'nx'],
    \   ['cc', '"_S', 'n'],
    \   ['C', '"_C', 'nx'],
    \   ['s', '"_s', 'nx'],
    \   ['S', '"_S', 'nx'],
    \   ['d', '"_d', 'nx'],
    \   ['dd', '"_dd', 'n'],
    \   ['D', '"_D', 'nx'],
    \   ['x', '"_x', 'nx'],
    \   ['X', '"_X', 'nx'],
    \ ]

    for binding in bindings
        call call("cutlass#addWeakMapping", binding)
    endfor
endfunction

function! cutlass#redirectDefaultsToBlackhole()
    call cutlass#overrideDeleteAndChangeBindings()
    call cutlass#overrideSelectBindings()
endfunction

