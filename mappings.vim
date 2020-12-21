" Git mappings
nmap <leader>gb :Git blame<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gs :Git status<CR>
nmap <leader>gd :Git diff<CR>
nmap <leader>gpull :Git pull<CR>
nmap <leader>gpush :Git push<CR>
nmap <leader>gad :Git add 
nmap <leader>gaf :call GitAddCurrentFile()<CR>
nmap <leader>gco :Git commit<CR> 
nmap <leader>gca :Git commit --amend<CR> 
nmap <leader>gr :Git restore 
nmap <leader>gch :Git checkout 

nmap <C-P> :FZF<CR>
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in = 1

" Dotnet mappings
nmap <leader>db :!dotnet build<CR>
nmap <leader>dt :call DotnetTestFile()<CR>

function GitAddCurrentFile()
    let file = expand("%:p")
    execute ':Git add ' . file
endfunction

function DotnetTestFile()
    let file = split(expand("%:t"), '\.')
    echo file[0]
    execute ':!dotnet test --filter FullyQualifiedName\~' . file[0]
endfunction

nmap <leader>so <CR>:w <bar> so %<CR>
nmap <leader>w <CR>:w<CR>

set wildcharm=<c-z>
cnoremap <expr> <Tab>   getcmdtype() =~ '[?/]' ? "<c-g>" : "<c-z>"
cnoremap <expr> <S-Tab> getcmdtype() =~ '[?/]' ? "<c-t>" : "<S-Tab>"
"
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
