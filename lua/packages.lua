local Plug = vim.fn['plug#']

vim.call('plug#begin', 'C:/User/julian/AppData/local/nvim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'vim-test/vim-test'
Plug('rcarriga/vim-ultest', { ['do'] = 'UpdateRemotePlugins' })
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate' })
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
vim.call('plug#end')

