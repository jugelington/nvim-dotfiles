require('packages')
require('mappings')
require('general_settings')
require('lsp_settings')
require('treesitter_settings')

require'nvim-tree'.setup()
require'telescope'.load_extension 'file_browser'

require'null-ls'.setup({
    sources = {
  --      require'null-ls'.builtins.formatting.astyle, -- cs linting
  --      require'null-ls'.builtins.formatting.clang_format, -- cs linting
        require'null-ls'.builtins.formatting.uncrustify -- cs linting
        },
})
