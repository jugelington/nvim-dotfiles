require('packages')
require('mappings')
require('general_settings')
require('lsp_settings')
require('treesitter_settings')
require('cmp_settings')
require('vsnip_settings')

require'nvim-tree'.setup()
require'telescope'.load_extension 'file_browser'
