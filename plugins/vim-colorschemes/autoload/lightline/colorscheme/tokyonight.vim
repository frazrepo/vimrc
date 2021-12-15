" =============================================================================
" URL: https://github.com/ghifarit53/tokyonight-vim/
" Filename: autoload/lightline/colorscheme/tokyonight.vim
" Author: Ghifari Taqiuddin
" Email: mghifarit53@gmail.com
" License: MIT License
" =============================================================================

"{{{Palette
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:style = get(g:, 'tokyonight_style', 'night')

if s:style ==# 'night'
	let s:foreground = [ '#a9b1d6', 250 ]
	let s:background = [ '#1a1b26', 235 ]
	let s:background_alt = [ '#232433', 236 ]
	let s:background_grey = [ '#444B6A', 238 ]
	let s:red = [ '#F7768E', 203 ]
	let s:yellow = [ '#E0AF68', 179 ]
	let s:green = [ '#9ECE6A', 107 ]
	let s:blue = [ '#7AA2F7', 110 ]
	let s:purple = [ '#ad8ee6', 176 ]
elseif s:style ==# 'storm'
	let s:foreground = [ '#a9b1d6', 250 ]
	let s:background = [ '#24283b', 235 ]
	let s:background_alt = [ '#2c3047', 236 ]
	let s:background_grey = [ '#444B6A', 238 ]
	let s:red = [ '#F7768E', 203 ]
	let s:yellow = [ '#E0AF68', 179 ]
	let s:green = [ '#9ECE6A', 107 ]
	let s:blue = [ '#7AA2F7', 110 ]
	let s:purple = [ '#ad8ee6', 176 ]
endif
"}}}

"{{{Definition
let s:tab_l_fg = s:foreground
let s:tab_l_bg = s:background_grey
let s:tab_r_fg = s:red
let s:tab_r_bg = s:background_grey
let s:tab_sel_fg = s:background
let s:tab_sel_bg = s:red
let s:tab_middle_fg = s:foreground
let s:tab_middle_bg = s:background_alt

let s:warningfg = s:background
let s:warningbg = s:yellow
let s:errorfg = s:background
let s:errorbg = s:red

let s:normal_l1_fg = s:background
let s:normal_l1_bg = s:blue
let s:normal_l2_fg = s:foreground
let s:normal_l2_bg = s:background_grey
let s:normal_r1_fg = s:background
let s:normal_r1_bg = s:blue
let s:normal_r2_fg = s:foreground
let s:normal_r2_bg = s:background_grey
let s:normal_middle_fg = s:foreground
let s:normal_middle_bg = s:background_alt

let s:insert_l1_fg = s:background
let s:insert_l1_bg = s:green
let s:insert_l2_fg = s:foreground
let s:insert_l2_bg = s:background_grey
let s:insert_r1_fg = s:background
let s:insert_r1_bg = s:green
let s:insert_r2_fg = s:foreground
let s:insert_r2_bg = s:background_grey
let s:insert_middle_fg = s:foreground
let s:insert_middle_bg = s:background_alt

let s:visual_l1_fg = s:background
let s:visual_l1_bg = s:purple
let s:visual_l2_fg = s:foreground
let s:visual_l2_bg = s:background_grey
let s:visual_r1_fg = s:background
let s:visual_r1_bg = s:purple
let s:visual_r2_fg = s:foreground
let s:visual_r2_bg = s:background_grey
let s:visual_middle_fg = s:foreground
let s:visual_middle_bg = s:background_alt

let s:replace_l1_fg = s:background
let s:replace_l1_bg = s:yellow
let s:replace_l2_fg = s:foreground
let s:replace_l2_bg = s:background_grey
let s:replace_r1_fg = s:background
let s:replace_r1_bg = s:yellow
let s:replace_r2_fg = s:foreground
let s:replace_r2_bg = s:background_grey
let s:replace_middle_fg = s:foreground
let s:replace_middle_bg = s:background_alt

let s:inactive_l1_fg = s:foreground
let s:inactive_l1_bg = s:background_grey
let s:inactive_l2_fg = s:foreground
let s:inactive_l2_bg = s:background_grey
let s:inactive_r1_fg = s:foreground
let s:inactive_r1_bg = s:background_grey
let s:inactive_r2_fg = s:foreground
let s:inactive_r2_bg = s:background_grey
let s:inactive_middle_fg = s:foreground
let s:inactive_middle_bg = s:background_alt

"}}}

"{{{Implementation
let s:p.normal.middle = [ [ s:normal_middle_fg, s:normal_middle_bg ] ]
let s:p.normal.left = [ [ s:normal_l1_fg, s:normal_l1_bg ], [ s:normal_l2_fg, s:normal_l2_bg ] ]
let s:p.normal.right = [ [ s:normal_r1_fg, s:normal_r1_bg ], [ s:normal_r2_fg, s:normal_r2_bg ] ]

let s:p.insert.middle = [ [ s:insert_middle_fg, s:insert_middle_bg ] ]
let s:p.insert.left = [ [ s:insert_l1_fg, s:insert_l1_bg ], [ s:insert_l2_fg, s:insert_l2_bg ] ]
let s:p.insert.right = [ [ s:insert_r1_fg, s:insert_r1_bg ], [ s:insert_r2_fg, s:insert_r2_bg ] ]

let s:p.visual.middle = [ [ s:visual_middle_fg, s:visual_middle_bg ] ]
let s:p.visual.left = [ [ s:visual_l1_fg, s:visual_l1_bg ], [ s:visual_l2_fg, s:visual_l2_bg ] ]
let s:p.visual.right = [ [ s:visual_r1_fg, s:visual_r1_bg ], [ s:visual_r2_fg, s:visual_r2_bg ] ]

let s:p.replace.middle = [ [ s:replace_middle_fg, s:replace_middle_bg ] ]
let s:p.replace.left = [ [ s:replace_l1_fg, s:replace_l1_bg ], [ s:replace_l2_fg, s:replace_l2_bg ] ]
let s:p.replace.right = [ [ s:replace_r1_fg, s:replace_r1_bg ], [ s:replace_r2_fg, s:replace_r2_bg ] ]

let s:p.inactive.left = [ [ s:inactive_l1_fg, s:inactive_l1_bg ], [ s:inactive_l2_fg, s:inactive_l2_bg ] ]
let s:p.inactive.middle = [ [ s:inactive_middle_fg, s:inactive_middle_bg ] ]
let s:p.inactive.right = [ [ s:inactive_r1_fg, s:inactive_r1_bg ], [ s:inactive_r2_fg, s:inactive_r2_bg ] ]

let s:p.tabline.left = [ [ s:tab_l_fg, s:tab_l_bg] ]
let s:p.tabline.right = [ [ s:tab_r_fg, s:tab_r_bg] ]
let s:p.tabline.tabsel = [ [ s:tab_sel_fg, s:tab_sel_bg ] ]
let s:p.tabline.middle = [ [ s:tab_middle_fg, s:tab_middle_bg] ]

let s:p.normal.error = [ [ s:errorfg, s:errorbg ] ]
let s:p.normal.warning = [ [ s:warningfg, s:warningbg ] ]

"}}}

let g:lightline#colorscheme#tokyonight#palette = lightline#colorscheme#flatten(s:p)
