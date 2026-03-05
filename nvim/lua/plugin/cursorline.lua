return {
  "yamatsum/nvim-cursorline",
  event = "VeryLazy",
  opts = {
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    },
  },
}
