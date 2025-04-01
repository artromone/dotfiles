local lspconfig = require("lspconfig")

local on_attach = require("lazyvim.util").lsp.on_attach
local capabilities = LazyVim.has("cmp-nvim-lsp") and require("cmp_nvim_lsp").default_capabilities() or nil

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
})

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {},
  },
}
