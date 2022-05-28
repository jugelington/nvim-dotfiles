local o = vim.o
local opt = vim.opt
local wo = vim.wo

o.expandtab=true
o.incsearch=true
o.shiftwidth=4
o.tabstop=4
opt.cursorline=true
opt.encoding='UTF-8'
opt.laststatus=3
--opt.t_Co='256'
opt.updatetime=300
wo.colorcolumn='125'
wo.number=true
wo.relativenumber=true
o.signcolumn='number'


vim.cmd([[
colorscheme torte
let g:airline_theme='ayu_mirage'

let test#strategy = "neovim"
let test#vim#term_position = "vert"
let g:test#csharp#runner = 'dotnettest'
let test#csharp#dotnettest#options = {
    \   'nearest': '--filter "Category!=IntegrationTests"',
    \   'file': '--filter "Category!=IntegrationTests"',
    \   'suite': '--filter "Category!=IntegrationTests"',
    \   'last': '--filter "Category!=IntegrationTests"',
    \   'visit': '--filter "Category!=IntegrationTests"',
    \}


let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

hi vertsplit ctermfg=1000
]])
