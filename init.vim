
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
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
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
Plug 'junegunn/fzf', { 'do': './install --all' }  " Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'akinsho/toggleterm.nvim'
"Plug 'glepnir/dashboard-nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'rmagatti/auto-session'
Plug 'lfv89/vim-interestingwords'
Plug 'famiu/bufdelete.nvim'

" Plug '~/my-prototype-plugin' " Unmanaged plugin (manually installed and updated)
call plug#end()



" ###############################################################################################
" VIM Settings
" ###############################################################################################
set encoding=utf-8
set termguicolors
set rnu                     " relative line number
set number                  " add line numbers
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set smartcase               " override the 'ignorecase' when there is uppercase letters
set undolevels=1000
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

" {{{ terminal
  " uncomment following shell settings to use powershell on windows
  " let &shell = 'pwsh'
  " let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  " let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  " let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  " set shellquote= shellxquote=

  map <leader>tm :ToggleTerm<CR>
  tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  " Key to exit terminal command mode
  "tnoremap <C-[> <C-\><C-n>
  "command! -nargs=* T split | terminal <args>
  "command! -nargs=* VT vsplit | terminal <args>
" }}}


" {{{ quickfix
  map <silent> <leader>qo :copen<CR>
  map <silent> <leader>qc :cclose<CR>
  map <silent> <a-,>      :colder<CR>
  map <silent> <a-.>      :cnewer<CR>
" }}}

" .h file is s source code
let g:c_syntax_for_h = 1

" Copy current file path to clipboard
function! CopyCurrentFilePath()
  let @+ = expand('%')
  echo @+
endfunction
nnoremap <leader>% :call CopyCurrentFilePath()<CR>

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

  " - Preview windows (disable)
  let g:fzf_preview_window = []
  "let g:fzf_preview_window = ['right:50%', 'ctrl-/']
  
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

" {{{ dashboard
  " Default value is clap
  " let g:dashboard_default_executive ='fzf'

  " let g:dashboard_custom_header = [
  " \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  " \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  " \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  " \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  " \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  " \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  " \]
" }}}

" {{{ markdown preview 
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
  let g:mkdp_auto_start = 0
  
  " set to 1, the nvim will auto close current preview window when change
  " from markdown buffer to another buffer
  " default: 1
  let g:mkdp_auto_close = 1
  
  " set to 1, the vim will refresh markdown when save the buffer or
  " leave from insert mode, default 0 is auto refresh markdown as you edit or
  " move the cursor
  " default: 0
  let g:mkdp_refresh_slow = 0
  
  " set to 1, the MarkdownPreview command can be use for all files,
  " by default it can be use in markdown file
  " default: 0
  let g:mkdp_command_for_global = 0
  
  " set to 1, preview server available to others in your network
  " by default, the server listens on localhost (127.0.0.1)
  " default: 0
  let g:mkdp_open_to_the_world = 0
  
  " use custom IP to open preview page
  " useful when you work in remote vim and preview on local browser
  " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
  " default empty
  let g:mkdp_open_ip = ''
  
  " specify browser to open preview page
  " default: ''
  let g:mkdp_browser = ''
  
  " set to 1, echo preview page url in command line when open preview page
  " default is 0
  let g:mkdp_echo_preview_url = 0
  
  " a custom vim function name to open preview page
  " this function will receive url as param
  " default is empty
  let g:mkdp_browserfunc = ''
  
  " options for markdown render
  " mkit: markdown-it options for render
  " katex: katex options for math
  " uml: markdown-it-plantuml options
  " maid: mermaid options
  " disable_sync_scroll: if disable sync scroll, default 0
  " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
  "   middle: mean the cursor position alway show at the middle of the preview page
  "   top: mean the vim top viewport alway show at the top of the preview page
  "   relative: mean the cursor position alway show at the relative positon of the preview page
  " hide_yaml_meta: if hide yaml metadata, default is 1
  " sequence_diagrams: js-sequence-diagrams options
  " content_editable: if enable content editable for preview page, default: v:false
  " disable_filename: if disable filename header for preview page, default: 0
  let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {},
      \ 'flowchart_diagrams': {},
      \ 'content_editable': v:false,
      \ 'disable_filename': 0
      \ }
  
  " use a custom markdown style must be absolute path
  " like '/Users/username/markdown.css' or expand('~/markdown.css')
  let g:mkdp_markdown_css = ''
  
  " use a custom highlight style must absolute path
  " like '/Users/username/highlight.css' or expand('~/highlight.css')
  let g:mkdp_highlight_css = ''
  
  " use a custom port to start server or random for empty
  let g:mkdp_port = ''
  
  " preview page title
  " ${name} will be replace with the file name
  let g:mkdp_page_title = '「${name}」'
  
  " recognized filetypes
  " these filetypes will have MarkdownPreview... commands
  let g:mkdp_filetypes = ['markdown']

" }}}

" {{{ vim-grepper
let &statusline .= ' %{grepper#statusline()}'
nnoremap <leader>s* :Grepper -tool rg -cword -noprompt<cr>
"let g:grepper = {
"    \ 'tools': ['ack', 'git', 'rg'],
"    \ 'ack': {
"    \   'grepprg':    'C:\\Strawberry\\perl\\bin\\perl.exe C:\\Users\\edwar\\AppData\\Local\\nvim\\ack-v3.5.0.pl',
"    \   'grepformat': '%f:%l:%m',
"    \   'escape':     '\+*^$()[]',
"    \ }}

" }}}


" ###############################################################################################
" Plugin Settings - Lau
" ###############################################################################################
lua require('init')


" {{{ vs-snippt
  let g:vsnip_snippet_dir = stdpath("config").'/.vsnip'
  
  " Expand
  imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
  smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

  " Expand or jump
  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

  " Jump forward or backward
  imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

  " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
  " See https://github.com/hrsh7th/vim-vsnip/pull/50
  "nmap        s   <Plug>(vsnip-select-text)
  "xmap        s   <Plug>(vsnip-select-text)
  "nmap        S   <Plug>(vsnip-cut-text)
  "xmap        S   <Plug>(vsnip-cut-text)
" }}}

" {{{ vim-interestingwords
" }}}

" {{{ bufdelete.nvim
  :nnoremap <Leader>q :Bdelete<CR>
" }}}
