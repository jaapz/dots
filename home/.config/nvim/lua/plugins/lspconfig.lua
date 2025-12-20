local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("ts_ls", {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
})

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            gofumpt = true
        }
    }
})

vim.lsp.enable({
    'ty',
    'ts_ls',
    'gopls',
    'ruff',
}, {
    capabilities = capabilities
})

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
        require("none-ls.formatting.eslint_d"),
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.code_actions.eslint_d"),
        require("none-ls.diagnostics.flake8"),
        require("null-ls").builtins.diagnostics.stylelint,
        require("null-ls").builtins.diagnostics.golangci_lint.with({
            prefer_local = ".tools",
            args = {
                "run",
                "--fix=false",
                "--fast",
                "--out-format=json",
            },
        }),
    },
})
