local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.pyright.setup{
    capabilities = capabilities,
}
require'lspconfig'.ts_ls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false 
    end,
}
require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}
require'lspconfig'.ruff.setup{
    capabilities = capabilities,
}
require'lspconfig'.mdx_analyzer.setup{}

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
        require("null-ls").builtins.formatting.stylelint,
        require("null-ls").builtins.formatting.prettier.with({
            disabled_filetypes = { "html.handlebars", },
        }),
        require("null-ls").builtins.formatting.gofumpt,
        require("none-ls.formatting.eslint_d"),
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.code_actions.eslint_d"),
        require("none-ls.diagnostics.flake8"),
        require("null-ls").builtins.diagnostics.stylelint,
        require("null-ls").builtins.diagnostics.golangci_lint.with({
            prefer_local = ".bin",
            args = {
                "run",
                "--fix=false",
                "--fast",
                "--out-format=json",
            },
        }),
    },
})
