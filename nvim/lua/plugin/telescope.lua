return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    
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