
" ###############################################################################################
" Plugins - 
"   Managed by vim-plug
"   Make sure you use single quotes
"   Specify a directory for plugins
"     - For Neovim: stdpath('data') . '/plugged'
"     - Avoid using standard Vim directory names like 'plugin'
"   Multiple Plug commands can be written in a single line using | separators
" ###############################################################################################
call plug#begin('~/.nvim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-grepper'
" Plug 'jiangmiao/auto-pairs'
Plug 'LunarWatcher/auto-pairs'
" Plug 'windwp/nvim-autopairs'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip' " For vsnip users.
Plug 'hrsh7th/vim-vsnip' " For vsnip users.
" Plug 'simrat39/symbols-outline.nvim'
Plug 'hedyhli/outline.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " On-demand loading
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'nsf/gocode', { 'rtp': 'vim' }  " Plugin options
" Plug 'mrcjkb/rustaceanvim'   " using lsp instead of this plugin for rust
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': './install --all' }  " Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'akinsho/toggleterm.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'rmagatti/auto-session'
Plug 'sbdchd/neoformat'
Plug 'dwrdx/mywords.nvim' 
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-neotest/nvim-nio'
Plug 'ldelossa/nvim-dap-projects'
Plug 'kevinhwang91/nvim-bqf'
Plug 'folke/which-key.nvim'
Plug 'williamboman/mason.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'danymat/neogen'
Plug 'mhinz/vim-startify'

Plug 'joshdick/onedark.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'christoomey/vim-tmux-navigator'

Plug 'github/copilot.vim'
Plug 'Exafunction/codeium.vim'

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
let mapleader=","
filetype on
filetype plugin indent on   "allow auto-indenting depending on file type
filetype plugin on
syntax on                   " syntax highlighting
set clipboard=unnamedplus   " using system clipboard
set completeopt=menu,menuone,noselect
" colorscheme onedark
colorscheme tokyonight
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

  map <leader>tm :1ToggleTerm<CR>
  tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  " Key to exit terminal command mode
  "tnoremap <C-[> <C-\><C-n>
  "command! -nargs=* T split | terminal <args>
  "command! -nargs=* VT vsplit | terminal <args>
" }}}


" {{{ quickfix
  map <silent> <leader>qo :copen<CR>
  map <silent> <leader>qc :cclose<CR>
  map <silent> <A-,>      :colder<CR>
  map <silent> <A-.>      :cnewer<CR>
" }}}

" .h file is s source code
let g:c_syntax_for_h = 1

source <sfile>:h/utils/helper.vim


" ###############################################################################################
" Plugin Settings - VIM Script
" ###############################################################################################
" {{{ symbols-outline
  nmap <F4> :Outline<CR>
  nmap <a-o> :Outline<CR>
" }}}


" {{{ nerdtree - is replaced by nvim-tree.lua, will be removed later
  " let g:NERDTreeMinimalUI = 1
  " let g:NERDTreeHijackNetrw = 0
  " let g:NERDTreeWinSize = 31
  " let g:NERDTreeChDirMode = 2
  " let g:NERDTreeAutoDeleteBuffer = 1
  " let g:NERDTreeShowBookmarks = 1
  " let g:NERDTreeCascadeOpenSingleChildDir = 1
  " let g:NERDTreeQuitOnOpen = 1

  " nmap <F3> :NERDTreeToggle<CR>
  " nmap <a-m> :NERDTreeToggle<CR>
" }}}
"
" {{{ nvim-tree.lua
  let g:NvimTreeZoomFlag = 0
  function! s:nvimtree_zoom()
    if g:NvimTreeZoomFlag == 0
      execute 'NvimTreeResize +20'
      let g:NvimTreeZoomFlag = 1
    else
      execute 'NvimTreeResize -20'
      let g:NvimTreeZoomFlag = 0
    endif
  endfunction

  nnoremap <a-m> :NvimTreeToggle<CR>
  nnoremap <a-r> :call <SID>nvimtree_zoom()<CR>
  " nnoremap <leader>r :NvimTreeRefresh<CR>
  " nnoremap <leader>n :NvimTreeFindFile<CR>
  " highlight NvimTreeFolderIcon guibg=blue
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
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
  " let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
  " let g:fzf_layout = { 'window': '10new' }

  " - Preview windows (disable)
  " let g:fzf_preview_window = []
  let g:fzf_preview_window = ['right:50%', 'ctrl-/']
  
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
  nnoremap <silent> <leader>b :Buffers<CR>
  nnoremap <silent> <leader>fw :Windows<CR>
  nnoremap <silent> <leader>fb :BLines<CR>
  nnoremap <silent> <leader>fm :Marks<CR>
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

  let $FZF_DEFAULT_COMMAND="rg --files"  " --no-ignore-vcs"
  let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,alt-n:next-history,alt-p:previous-history,ctrl-n:down,ctrl-p:up'


  " use fzf to delete buffers: https://github.com/junegunn/fzf.vim/pull/733
  function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
  endfunction
  
  function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
  endfunction
  
  command! BD call fzf#run(fzf#wrap({
    \ 'source': s:list_buffers(),
    \ 'sink*': { lines -> s:delete_buffers(lines) },
    \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
  \ }))

  " use fzf to search keymaps
  function! s:list_keymaps()
    redir => list
    silent map
    redir END
    return split(list, "\n")
  endfunction
  
  command! Whichkey call fzf#run(fzf#wrap({
    \ 'source': s:list_keymaps()
  \ }))
" }}}

" {{{ markdown preview 
  let g:mkdp_auto_start = 0
  let g:mkdp_auto_close = 1
  let g:mkdp_refresh_slow = 0
  let g:mkdp_command_for_global = 0
  let g:mkdp_open_to_the_world = 0
  let g:mkdp_open_ip = ''
  let g:mkdp_browser = ''
  let g:mkdp_echo_preview_url = 0
  let g:mkdp_browserfunc = ''
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
  let g:mkdp_markdown_css = ''
  let g:mkdp_highlight_css = ''
  let g:mkdp_port = ''
  let g:mkdp_page_title = '「${name}」'
  let g:mkdp_filetypes = ['markdown']

" }}}

" {{{ vim-grepper
  let &statusline .= ' %{grepper#statusline()}'
  highlight Directory
    \ ctermfg=216 ctermbg=NONE cterm=NONE guifg=#ffaf87 guibg=NONE gui=NONE
  highlight qfLineNr
    \ ctermfg=238 ctermbg=NONE cterm=NONE guifg=#444444 guibg=NONE gui=NONE
  highlight qfSeparator
    \ ctermfg=243 ctermbg=NONE cterm=NONE guifg=#767676 guibg=NONE gui=NONE

  nnoremap <leader>s* :Grepper -tool rg -cword -noprompt<cr>
  nnoremap <leader>sc :GrepperRg -tc "<cword>"<cr>
  nnoremap <leader>sr :GrepperRg -trust "<cword>"<cr>
  nnoremap <leader>sm :GrepperRg -tcmake "<cword>"<cr>
  nnoremap <leader>sp :GrepperRg -tpy "<cword>"<cr>
  nnoremap <leader>sg :GrepperRg -tgo "<cword>"<cr>
  nnoremap <leader>sa* :GrepperAck <cword><cr>
" }}}


" {{{ load lua setting
  lua require('init')
" }}}


" {{{ vs-snippt
  let g:vsnip_snippet_dir = stdpath("config").'/.vsnip'
  
  " Expand
  " imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
  " smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

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

" {{{ treesitter + fold
  set foldlevel=2
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()

  function! ToggleFold()
    if &filetype ==# 'json'
      set foldenable
    else
      set nofoldenable
    endif
  endfunction
" }}}

" {{{ gitgutter
  nmap <leader>n <Plug>(GitGutterNextHunk)
  nmap <leader>p <Plug>(GitGutterPrevHunk)
  command! Gqf GitGutterQuickFix | copen
" }}}

" {{{ neoformat
 let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style=file']
  \} 
  let g:neoformat_enabled_cpp = ['clangformat']
  let g:neoformat_enabled_c = ['clangformat']
  let g:neoformat_basic_format_retab = 1
  let g:neoformat_basic_format_trim = 1
" }}}

" {{{ autocmd
  " set file type
  autocmd BufRead,BufNewFile *Jenkinsfile set filetype=groovy
  autocmd BufWritePre *.go lua goimports(1000)

  augroup autofold
    autocmd!
    autocmd BufRead *.* call ToggleFold() | Outline
  augroup END

  " use sbdchd/neoformat to format code on saving
  augroup fmt
    autocmd!
    autocmd BufWritePre *.py undojoin | Neoformat
    autocmd BufWritePre *.go undojoin | Neoformat
    autocmd BufWritePre *.rs undojoin | Neoformat

    " uncomment below sections for auto formating clang using clang-format
    " autocmd BufWritePre *.c undojoin | Neoformat
    " autocmd BufWritePre *.h undojoin | Neoformat
  augroup END

  " make quickfix window size fixed to 10 rows
  autocmd FIleType qf 10wincmd_
" }}}

" {{{ barbar
lua << EOF
require'barbar'.setup {
  animation = true,
  auto_hide = false,
  tabpages = true,
  clickable = false,
  icons = {
    buffer_index = false,
    buffer_number = false,
    button = '',
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = false, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = false},
    },
    filetype = {
      custom_colors = false,
      enabled = false,
    },
    separator = {left = '▎', right = ''},
    modified = {button = '●'},
    pinned = {button = '車'},
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
  },
  insert_at_end = false,
  insert_at_start = false,
  maximum_padding = 1,
  minimum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}
EOF

  nnoremap <silent>    <A-h> :BufferPrevious<CR>
  nnoremap <silent>    <A-l> :BufferNext<CR>
  nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
  nnoremap <silent>    <A->> :BufferMoveNext<CR>
  nnoremap <silent>    <A-1> :BufferGoto 1<CR>
  nnoremap <silent>    <A-2> :BufferGoto 2<CR>
  nnoremap <silent>    <A-3> :BufferGoto 3<CR>
  nnoremap <silent>    <A-4> :BufferGoto 4<CR>
  nnoremap <silent>    <A-5> :BufferGoto 5<CR>
  nnoremap <silent>    <A-6> :BufferGoto 6<CR>
  nnoremap <silent>    <A-7> :BufferGoto 7<CR>
  nnoremap <silent>    <A-8> :BufferGoto 8<CR>
  nnoremap <silent>    <A-9> :BufferLast<CR>
  " Pin/unpin buffer
  " nnoremap <silent>    <A-p> :BufferPin<CR>
  nnoremap <silent>    <A-c> :BufferClose<CR>
  " Wipeout buffer
  "                          :BufferWipeout<CR>
  " Close commands
  "                          :BufferCloseAllButCurrent<CR>
  "                          :BufferCloseAllButPinned<CR>
  "                          :BufferCloseBuffersLeft<CR>
  "                          :BufferCloseBuffersRight<CR>
  " Magic buffer-picking mode
  nnoremap <silent> <C-s>    :BufferPick<CR>
  " Sort automatically by...
  nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
  nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
  nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
  nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>
  
  " Other:
  " :BarbarEnable - enables barbar (enabled by default)
  " :BarbarDisable - very bad command, should never be used
" }}}

" {{{ neogen
  " keymaps for generating docstring
  nnoremap <silent> <leader>nf :lua require('neogen').generate()<CR>
" }}

" {{{ startify

  function! s:gitModified()
      let files = systemlist('git ls-files -m')
      return map(files, "{'line': v:val, 'path': v:val}")
  endfunction
  
  " same as above, but show untracked files, honouring .gitignore
  function! s:gitUntracked()
      let files = systemlist('git ls-files -o --exclude-standard')
      return map(files, "{'line': v:val, 'path': v:val}")
  endfunction
  
  let g:startify_session_dir = '~/.nvim_sessions'
  let g:startify_change_to_dir = 0

  let g:startify_commands = [
      \ {'c': 'echo stdpath("config")'},
      \ ]
  
  let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': function('s:gitModified'),  'header': ['   Git modified']},
          \ { 'type': function('s:gitUntracked'), 'header': ['   Git untracked']},
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
" }}}

nnoremap <leader>% :call CopyCurrentFilePath()<CR>

" {{{ window switching
  nnoremap <silent> <leader>w <C-w>w<CR>
" }}}


let g:AutoPairsPrefix = "<C-i>"

" {{{ DAP debugging
    nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
    nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
    nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
    nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
    nnoremap <silent> <Leader>p <Cmd>lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <Leader>P <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
    nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
" }}}

