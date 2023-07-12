local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.pyright.setup{
    capabilities = capabilities,
}
require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormatting = false
        client.server_capabilities.documentRangeFormatting = false 
    end,
}
require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormatting = false
        client.server_capabilities.documentRangeFormatting = false
    end,
}

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        source = "always",
        header = "",
        prefix = "",
    },
})

require("null-ls").setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
    end,
    sources = {
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.isort,
        require("null-ls").builtins.formatting.stylelint,
        require("null-ls").builtins.formatting.prettier.with({
            disabled_filetypes = { "html.handlebars", },
        }),
        require("null-ls").builtins.formatting.gofumpt,
        require("null-ls").builtins.diagnostics.eslint_d,
        require("null-ls").builtins.diagnostics.stylelint,
        require("null-ls").builtins.diagnostics.flake8,
        require("null-ls").builtins.diagnostics.golangci_lint.with({
            args = {
                "run",
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
