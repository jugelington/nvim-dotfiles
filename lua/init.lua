local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
local completion = require'completion'

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

local custom_on_attach = function(client, bufnr)
    completion.on_attach();
    mapper('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
    mapper('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
    mapper('n', 'gd',         'vim.lsp.buf.definition()')
    mapper('n', '<leader>ac',         'vim.lsp.buf.code_action()')
    mapper('n', '<leader>rn',         'vim.lsp.buf.rename()')
    mapper('n', 'K',     'vim.lsp.diagnostic.show_line_diagnostics()')
    mapper('n', 'gi',    'vim.lsp.buf.implementation()')
    mapper('n', '<c-k>', 'vim.lsp.buf.signature_help()')
    mapper('n', '1gD',   'vim.lsp.buf.type_definition()')
    mapper('n', 'gr',    'vim.lsp.buf.references()')
    mapper('n', 'g0',    'vim.lsp.buf.document_symbol()')
    mapper('n', 'gW',    'vim.lsp.buf.workspace_symbol()')
end

lspconfig.omnisharp.setup{
    on_attach = custom_on_attach
}

lspconfig.tsserver.setup{
    on_attach = custom_on_attach
}

lspconfig.sumneko_lua.setup{
    on_attach = custom_on_attach
}

lspconfig.FSharpLanguageServer.setup{
    on_attach = custom_on_attach;
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
    enable = { "c_sharp", "typescript" },
    disable = {},  -- list of language that will be disabled
    }
}

require('lspfuzzy').setup {}

--[[
do
    local method = 'textDocument/publishDiagnostics'
    local default_callback = vim.lsp.callbacks[method]
    vim.lsp.callbacks[method] = function(err, method, result, client_id)
        if not result then return end
        local uri = result.uri
        local bufnr = vim.uri_to_bufnr(uri)
        if not bufnr then
            err_message("LSP.publishDiagnostics: Couldn't find buffer for ", uri)
            return
        end
        vim.lsp.diagnostic.clear(bufnr)
        vim.lsp.diagnostic.save(result.diagnostics, bufnr)
        vim.lsp.diagnostic.set_underline(result.diagnostics, bufnr)
    end
end
--]]
