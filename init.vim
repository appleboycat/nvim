lua require('basic')
lua require("plugins")
lua require('keymap')



call plug#begin()
  Plug 'inkarkat/vim-mark'
  Plug 'inkarkat/vim-ingo-library'
  Plug 'inkarkat/vim-SearchSpecial'  "optional
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mark colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = ','
let g:indent_guides_auto_colors = 0
"let g:mwAutoLoadMarks = 1
let g:mwIgnoreCase = 0
"hi IndentGuidesOdd  guibg=red   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4
"
":map <Plug>Mark 
"command to check keymap
nmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
"nmap <leader>hn <Plug>MarkSearchCurrentPrev
nmap <silent> <leader>n <Plug>MarkSearchNext
nmap <silent> <leader>p <Plug>MarkSearchPrev
"nmap <leader>gn <Plug>MarkSearchGroupNext
"nmap <leader>gp <Plug>MarkSearchGroupPrev

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim.g.mapleader = ','
" vim.keymap.set('n', '<Leader>w', ':write<CR>')
" -- quickhl
" --vim.keymap.set('n', '<Leader>hl', '<Plug>(quickhl-manual-this)')
" --vim.keymap.set('n', '<Leader>hh', '<Plug>(quickhl-manual-reset)')
"
"
if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
  "let g:neovide_transparency = 0.8
  "let g:transparency = 0.8
  let g:neovide_fullscreen=v:true
  set guifont=Monaco\ Nerd\ Font\ Complete\ Mono:h12
  "let g:neovide_cursor_vfx_mode = "railgun"
  "let g:neovide_scrolling_animation_length=0.3 
  let g:neovide_refresh_rate=60
  "let g:neovide_cursor_annimation_length=0
  "let g:neovide_cursor_vfx_particle_speed = 100.0
  "let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
  let g:neovide_no_idle = v:true
  let g:neovide_profiler = v:true
  let g:neovide_scale_factor=1.0
  function! ChangeScaleFactor(delta)
      let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
  endfunction
  nnoremap <expr><C-=> ChangeScaleFactor(1.25)
  nnoremap <expr><C--> ChangeScaleFactor(1/1.25)
endif
