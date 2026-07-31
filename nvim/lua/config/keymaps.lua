-- VS Code-like keymappings

-- Window split
vim.keymap.set("n", "ss", ":split<Return><C-w>w", { desc = "Split horizontal" })
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { desc = "Split vertical" })
vim.keymap.set("n", "sq", "<C-w>c", { desc = "Close window" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "sh", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "sj", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "sk", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "sl", "<C-w>l", { desc = "Go to right window" })

-- Buffer navigation (Shift+h/l でタブ切り替え)
vim.keymap.set("n", "H", ":bprevious<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "L", ":bnext<CR>", { desc = "Go to next buffer" })

-- バッファを閉じる (Shift+x)
-- nvim-tree を開いていると :bd ではフォーカスがツリーへ移りタブが全て未選択になるため、
-- 先に右隣のタブへ移動してから元のバッファを削除する
vim.keymap.set("n", "X", function()
  local target = vim.api.nvim_get_current_buf()

  -- nvim-tree など一覧に出ないバッファでは何もしない
  if not vim.bo[target].buflisted then
    return
  end

  if vim.bo[target].modified then
    vim.notify("変更が保存されていません", vim.log.levels.WARN)
    return
  end

  vim.cmd("BufferLineCycleNext")
  -- 他にタブがない場合は空バッファを表示する
  if vim.api.nvim_get_current_buf() == target then
    vim.cmd("enew")
  end
  vim.api.nvim_buf_delete(target, {})
end, { desc = "Close current buffer" })

-- タブ(バッファ)の並び替え (Alt+h/l)
vim.keymap.set("n", "<A-h>", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<A-l>", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })

-- Move lines (Alt+j/k)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Indent (Tab/Shift+Tab in visual mode)
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Outdent" })

-- Copy with Ctrl+C (Visual mode)
vim.keymap.set("v", "<C-c>", "y", { desc = "Copy to clipboard" })

-- ファイルパスをクリップボードにコピー
vim.keymap.set('n', '<leader>yp', ':let @+ = expand("%:p")<CR>', { desc = 'Copy Absolute Path' })
vim.keymap.set('n', '<leader>yr', ':let @+ = expand("%")<CR>', { desc = 'Copy Relative Path' })
