local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>g', ':G<CR>')
map('n', '<leader>c', ':G checkout ')
map('n', '<leader>C', ':G checkout -b ')
map('n', '<leader>p', ':G pull')
map('n', '<leader>P', ':G push')

-- Telescope
map('n', '<leader>n', '<cmd>Telescope find_files<cr>')
map('n', '<leader>N', ':Telescope file_browser<cr>')
map('n', '<leader>m', '<cmd>Telescope buffers<cr>')
map('n', '<leader>M', '<cmd>Telescope live_grep<cr>')

map('n', '<leader>err', '<cmd>lua vim.diagnostic.setqflist()<cr>')

map('n', '<leader>form', '<cmd>lua vim.lsp.buf.format<cr>')



map('n', '<CR>', ':nohlsearch<CR>')

map('n', '<leader>t', ':TestNearest<CR>')
map('n', '<leader>T', ':TestFile<CR>')
map('n', '<leader>a', ':TestSuite<CR>')
map('n', '<leader>l', ':TestLast<CR>')
--map('n', '<leader>g', ':TestVisit<CR>')


map('n', '<leader>el', ':ConjureEval<CR>')
map('n', '<leader>eb', ':ConjureEvalFile<CR>')

-- nvim-lsp
local lsp_opts = { noremap=true, silent=true }
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', lsp_opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', lsp_opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', lsp_opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', lsp_opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', lsp_opts)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', lsp_opts)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', lsp_opts)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', lsp_opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', lsp_opts)
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', lsp_opts)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', lsp_opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', lsp_opts)
map('n', '<space>form', '<cmd>lua vim.lsp.buf.formatting()<CR>', lsp_opts)
