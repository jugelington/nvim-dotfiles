let useCoc = 0

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jugelington/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
if useCoc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'ojroques/nvim-lspfuzzy', { 'branch': 'main' }
endif
call plug#end()

runtime mappings.vim

if useCoc
    runtime lsp/coc.vim
else
    lua require('init')
endif

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

set hidden
set number
set relativenumber
set guifont=FiraMono\ NF:h9
set expandtab
set tabstop=4
set shiftwidth=0
set linebreak
set nofixeol
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

""let g:ctrlp_working_path_mode = 1
let g:NERDTreeChDirMode = 2

