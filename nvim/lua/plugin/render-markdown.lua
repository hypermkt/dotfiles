return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("render-markdown").setup({
      heading = {
        enabled = true,
        sign = true,
      },
      -- コードブロックを枠線付きで表示
      code = {
        enabled = true,
        style = "full",
      },
      -- テーブルを整形表示
      pipe_table = {
        enabled = true,
      },
    })
  end,
}
