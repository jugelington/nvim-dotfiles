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
colorscheme zellner
let g:airline_theme='ayu_mirage'

let test#strategy = "dispatch"
let test#vim#term_position = "vert"
let g:test#csharp#runner = 'dotnettest'
let test#csharp#dotnettest#options = {
    "\   'nearest': '--filter "Category!=IntegrationTests"',
    "\   'file': '--filter "Category!=IntegrationTests"',
    \   'suite': '--filter "Category!=IntegrationTests"',
    \   'last': '--filter "Category!=IntegrationTests"',
    \   'visit': '--filter "Category!=IntegrationTests"',
    \}


let g:asyncomplete_auto_completeopt = 0
set completeopt=menu,menuone,noselect

hi vertsplit ctermfg=1000

let g:loaded_python_provider=0
let g:python3_host_prog = '/usr/local/bin/python3'
set pyxversion=3
]])
