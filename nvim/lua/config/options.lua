-- Leader key
vim.g.mapleader = ","

-- 行番号表示
vim.opt.number = true

-- インデント
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- クリップボード共有
vim.opt.clipboard = "unnamedplus"

-- 長い行を折り返さない
vim.opt.wrap = false

-- 基本コマンド
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

