# neovim-config

Actively updated neovim configuration that is being used by myself

### How to use

1. Find the nvim config locaton on your computer by running `:echo stdpath('config')` in neovim
2. Clone this project to your nvim config folder
3. Install [vim-plug](https://github.com/junegunn/vim-plug) then run `:PlugInstall`
4. Install pyright by `npm i -g pyright` to get python lsp working
5. Install [clangd](https://clangd.llvm.org/installation) to get clangd lsp working

### Plugins

Plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug)

* [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
* [danymat/neogen](https://github.com/danymat/neogen)
* [dwrdx/mywords.nvim](https://github.com/dwrdx/mywords.nvim)
* [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
* [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
* [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
* [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
* [hrsh7th/cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)
* [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
* [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
* [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)
* [junegunn/fzf](https://github.com/junegunn/fzf)
* [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)
* [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align)
* [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
* [mhinz/vim-grepper](https://github.com/mhinz/vim-grepper)
* [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [nsf/gocode](https://github.com/nsf/gocode)
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [rmagatti/auto-session](https://github.com/rmagatti/auto-session)
* [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim)
* [sbdchd/neoformat](https://github.com/sbdchd/neoformat)
* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot)
* [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
* [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-scripts/a.vim](https://github.com/vim-scripts/a.vim)

### Beautiful Fonts

This config is using `BitstreamVeraSansMono Nerd Font`
more patched nerd fonts can be found at [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts)

### Utilities

* nvimps.ps1 - a small script to launch nvim TUI from powershell and change the title of powershell with 
               working directory name
* neovim.bat - a small script to launch nvim TUI from command prompt and change the title of cmd with 
               working directory name
* add_right_context_menu.reg - an example Windows Registry file to add `Edit with NeoVim` to right click context menu 
                               on Windows, remember to change the path of neovim executable accordingly


### Snippets

* clang
* python from [NexSabre/vscode-python-snippets](https://github.com/NexSabre/vscode-python-snippets)
