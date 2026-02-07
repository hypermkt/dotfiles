return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        -- スペース区切りで部分一致（AND検索）を有効にする
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- 曖昧検索を有効化
          override_generic_sorter = true,  -- ジェネリックソーターを上書き
          override_file_sorter = true,     -- ファイルソーターを上書き
          case_mode = "smart_case",        -- 大文字小文字をスマートに判別
        }
      }
    })

    -- fzf 拡張をロード
    telescope.load_extension('fzf')
    
    -- Original keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

    -- VS Code like keymaps
    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Search files" })
    vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Search text" }) -- Note: VS Code uses C-S-f, but C-f is easier in terminal
  end,
}