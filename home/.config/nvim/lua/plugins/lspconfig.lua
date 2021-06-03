local cfg =  {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 0, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
  hint_enable = false, -- virtual hint enable
  hint_prefix = "",  -- Panda for parameter
  hint_scheme = "String",
  handler_opts = {
    border = "none"   -- double, single, shadow, none
  },
}

local lsp_signature = require('lsp_signature')

require'lspconfig'.pyright.setup{
    on_attach = function(client, bufnr)
        lsp_signature.on_attach(cfg)
    end,
}
require'lspconfig'.tsserver.setup{
    on_attach = function(client, bufnr)
        lsp_signature.on_attach(cfg)
    end,
}
require'lspconfig'.gopls.setup{
    on_attach = function(client, bufnr)
        lsp_signature.on_attach(cfg)
    end,
}
