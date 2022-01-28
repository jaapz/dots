local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.pyright.setup{
    capabilities = capabilities,
}
require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end,
}
require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end,
}

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    float = { border = "single" },
})

require("lsp_lines").register_lsp_virtual_lines()

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.isort,
        require("null-ls").builtins.formatting.stylelint,
        require("null-ls").builtins.formatting.prettier.with({
            disabled_filetypes = { "html.handlebars", },
        }),
        require("null-ls").builtins.formatting.goimports,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.diagnostics.stylelint,
        require("null-ls").builtins.diagnostics.flake8,
        require("null-ls").builtins.diagnostics.golangci_lint.with({
            args = {
                "run",
                "--disable-all",
                "--enable=misspell",
                "--enable=godox",
                "--enable=revive",
                "--enable=govet",
                "--exclude-use-default=false",
                "--fix=false",
                "--fast",
                "--out-format=json",
                "$DIRNAME",
                "--path-prefix",
                "$ROOT",
            },
        }),
    },
})
