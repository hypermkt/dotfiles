return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- 自動でテーマに合わせる
        component_separators = '|',
        section_separators = '',
      },
    })
  end,
}
