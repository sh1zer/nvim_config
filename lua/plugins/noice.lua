return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    presets = {
      lsp_doc_border = true, -- adds border to LSP hover docs
    },
    lsp = {
      signature = {
        enabled = false,
      },
    },
  },
}
