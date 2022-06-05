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


