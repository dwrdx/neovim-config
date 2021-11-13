
" ###############################################################################################
" Plugins - 
"   Managed by vim-plug
"   Make sure you use single quotes
"   Specify a directory for plugins
"     - For Neovim: stdpath('data') . '/plugged'
"     - Avoid using standard Vim directory names like 'plugin'
"   Multiple Plug commands can be written in a single line using | separators
" ###############################################################################################
call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-grepper'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip' " For vsnip users.
Plug 'hrsh7th/vim-vsnip' " For vsnip users.
Plug 'simrat39/symbols-outline.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " On-demand loading
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-commentary'
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }  " Plugin options
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'akinsho/toggleterm.nvim'
Plug 'glepnir/dashboard-nvim'
" Plug '~/my-prototype-plugin' " Unmanaged plugin (manually installed and updated)
call plug#end()



" ###############################################################################################
" VIM Settings
" ###############################################################################################
"set guifont=Bitstream\ Vera\ Sans\ Mono:h18
set guifont=Consolas:h18
"Roboto\ Mono\ for\ Powerline:h18
set encoding=utf-8
set termguicolors
set rnu                     " relative line number
set number                  " add line numbers
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set smartcase               " override the 'ignorecase' when there is uppercase letters
set mouse=v                 " middle-click paste with 
set mouse=a                 " enable mouse click
set cursorline              " highlight current cursorline
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set wildmode=longest,list   " get bash-like tab completions
set foldmethod=manual       " use manual folding
set diffopt=filler,vertical " default behavior for diff
set cc=120                  " set an 80 column border for good coding style
set hidden
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set clipboard=unnamedplus   " using system clipboard
set completeopt=menu,menuone,noselect
filetype plugin on
colorscheme onedark
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
" Terminal
"command! -nargs=* T split | terminal <args>
"command! -nargs=* VT vsplit | terminal <args>
map <leader>tm :ToggleTerm<CR>
" Key to exit terminal command mode
"tnoremap <C-[> <C-\><C-n>

" Toggle quickfix
map <silent> <leader>qo :copen<CR>
map <silent> <leader>qc :cclose<CR>

" Copy current file path to clipboard
function! CopyCurrentFilePath()
  let @+ = expand('%')
  echo @+
endfunction
nnoremap <leader>% :call CopyCurrentFilePath()<CR>

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

" ###############################################################################################
" Plugin Settings - VIM Script
" ###############################################################################################
" {{{ symbols-outline
  nmap <F4> :SymbolsOutline<CR>
" }}}

" {{{ nerdtree
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeHijackNetrw = 0
  let g:NERDTreeWinSize = 31
  let g:NERDTreeChDirMode = 2
  let g:NERDTreeAutoDeleteBuffer = 1
  let g:NERDTreeShowBookmarks = 1
  let g:NERDTreeCascadeOpenSingleChildDir = 1

  nmap <F3> :NERDTreeToggle<CR>
" }}}

" {{{ airline
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline#extensions#fugitiveline#enabled = 1
  "let g:airline_powerline_fonts = 1
  let g:airline_symbols_ascii = 1
  let g:airline_theme='onedark'
  "let g:airline_symbols.colnr = ''
  "let g:airline_symbols.linenr = ''
  let g:airline#extensions#virtualenv#enabled = 1
" }}}


" {{{ fzf , fzf-vim
  " An action can be a reference to a function that processes selected lines
  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction
  
  let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
  
  " - Popup window (center of the current window)
  "let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
  "let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
let g:fzf_layout = { 'window': '10new' }
  
  " Customize fzf colors to match your color scheme
  " - fzf#wrap translates this to a set of `--color` options
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }
  
  " Enable per-command history
  " - History files will be stored in the specified directory
  " - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
  "   'previous-history' instead of 'down' and 'up'.
  let g:fzf_history_dir = '~/.local/share/fzf-history'

  nnoremap <silent> <leader>ff :Files<CR>
  nnoremap <silent> <leader>be :Buffers<CR>
  nnoremap <silent> <leader>fw :Windows<CR>
  nnoremap <silent> <leader>fb :BLines<CR>
  "nnoremap <silent> <leader>o :BTags<CR>
  "nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>fh :History<CR>
  nnoremap <silent> <leader>fa :Rg<CR>


  function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
  endfunction

  autocmd! User FzfStatusLine call <SID>fzf_statusline()

  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

  let $FZF_DEFAULT_COMMAND="rg --files"
  let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,alt-n:next-history,alt-p:previous-history,ctrl-n:down,ctrl-p:up'
" }}}

" Default value is clap
let g:dashboard_default_executive ='fzf'

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

"let g:grepper = {
"    \ 'tools': ['ack', 'git', 'rg'],
"    \ 'ack': {
"    \   'grepprg':    'C:\\Strawberry\\perl\\bin\\perl.exe C:\\Users\\edwar\\AppData\\Local\\nvim\\ack-v3.5.0.pl',
"    \   'grepformat': '%f:%l:%m',
"    \   'escape':     '\+*^$()[]',
"    \ }}


" ###############################################################################################
" Plugin Settings - Lau
" ###############################################################################################
lua require('init')

