return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
        ruff = {},
        gopls = {},
        nil_ls = {},
        yamlls = {},
        ocamllsp = {},
        vtsls = {},
      },
    },
  },
}