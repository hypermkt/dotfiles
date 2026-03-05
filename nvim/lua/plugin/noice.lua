return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    cmdline = {
      view = "cmdline",
    },
    presets = {
      command_palette = false,
      lsp_doc_border = true,
    },
  },
}
