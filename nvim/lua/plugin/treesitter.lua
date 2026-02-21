return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.2",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "ruby", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "php" },
      highlight = {
        enable = true,
      },
    })
  end,
}


