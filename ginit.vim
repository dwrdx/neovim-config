" ###############################################################################################
" VIM GUI Settings
" ###############################################################################################
"
" Enable Mouse
set mouse=a

" Neovide configuration
if exists('g:neovide')
  function NeovideFullscreen()
      if g:neovide_fullscreen == v:true
          let g:neovide_fullscreen=v:false
      else
          let g:neovide_fullscreen=v:true
      endif
  endfunction
  map <F11> :call NeovideFullscreen()<cr>
endif

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    " GuiFont! Consolas:h14
    " GuiFont! Bitstream\ Vera\ Sans\ Mono:h13
    GuiFont! BitstreamVeraSansMono\ Nerd\ Font:h11

    " set guifont=Consolas:h18
    "Roboto\ Mono\ for\ Powerline:h18
    " GuiFont Roboto\ Mono\ for\ Powerline:h18
endif



" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

let bufferline.icons = v:true

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
