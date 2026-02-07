return {
  -- 開いているファイルをタブのように表示するプラグイン
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "none",
        diagnostics = "nvim_lsp", -- LSPの診断情報を表示
        offsets = {
          {
            -- サイドバー（nvim-tree）が表示されているときにバッファラインをずらす設定
            filetype = "nvim-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true
          }
        },
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
      }
    })
  end
}
