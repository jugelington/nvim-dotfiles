require('packages')
require('mappings')
require('general_settings')
require('lspconfig')
require('treesitterconfig')

require'nvim-tree'.setup()

require'null-ls'.setup({
    sources = {
  --      require'null-ls'.builtins.formatting.astyle, -- cs linting
  --      require'null-ls'.builtins.formatting.clang_format, -- cs linting
        require'null-ls'.builtins.formatting.uncrustify -- cs linting
        },
})
