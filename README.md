# neovim-config

Actively updated neovim configuration that is being used by myself

### How to use

1. Clone this project to your nvim config
2. Install [vim-plug](https://github.com/junegunn/vim-plug) then run `:PlugInstall`
3. Install pyright by `npm i -g pyright` to get python lsp working
4. Install [clangd](https://clangd.llvm.org/installation) to get clangd lsp working

### Plugins

Plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug)

* nvim-treesitter/nvim-treesitter
* mhinz/vim-grepper
* neovim/nvim-lspconfig
* hrsh7th/nvim-cmp
* hrsh7th/cmp-nvim-lsp
* hrsh7th/cmp-buffer
* hrsh7th/cmp-path
* hrsh7th/cmp-cmdline
* hrsh7th/cmp-vsnip
* hrsh7th/vim-vsnip
* simrat39/symbols-outline.nvim
* junegunn/vim-easy-align
* sheerun/vim-polyglot
* joshdick/onedark.vim
* scrooloose/nerdtree
* vim-scripts/a.vim
* tpope/vim-commentary
* nsf/gocode
* vim-airline/vim-airline
* junegunn/fzf
* junegunn/fzf.vim
* tpope/vim-fugitive
* akinsho/toggleterm.nvim
* glepnir/dashboard-nvim
* iamcco/markdown-preview.nvim
* rmagatti/auto-session
* dwrdx/mywords.nvim
* famiu/bufdelete.nvim

### Beautiful Fonts

This config is using `BitstreamVeraSansMono Nerd Font`
more patched nerd fonts can be found at [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts)

### Utilities

* nvimps.ps1 - a small script to launch nvim TUI from powershell and change the title of powershell with working directory name
* neovim.bat - a small script to launch nvim TUI from command prompt and change the title of cmd with working directory name


### Snippets

* clang
* python from [NexSabre/vscode-python-snippets](https://github.com/NexSabre/vscode-python-snippets)
