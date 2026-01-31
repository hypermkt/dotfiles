return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup()
    
    -- VS Code like Ctrl+/ (Terminal usually sends this as C-_)
    local api = require("Comment.api")
    vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, { desc = "Toggle comment" })
    vim.keymap.set("v", "<C-_>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment" })
    -- Fallback for some terminals sending actual /
    vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, { desc = "Toggle comment" })
    vim.keymap.set("v", "<C-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment" })
  end,
}
