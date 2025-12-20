require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  cmdline = {
    view = "cmdline",
  },
  popupmenu = {
    backend = 'cmp',
  },

  routes = {
    -- Ignore null-ls progress messages
    {
      filter = {
        event = "lsp",
        kind = "progress",
        cond = function(message)
          local client = vim.tbl_get(message.opts, "progress", "client")
          return client == "null-ls"
        end,
      },
      opts = { skip = true },
    },
  },

  presets = {
    bottom_search = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
})
