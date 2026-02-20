return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local function on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- デフォルトのマッピングを適用
      api.config.mappings.default_on_attach(bufnr)

      -- 十字キーでディレクトリを展開・折り畳むための設定
      -- 右キー: ディレクトリを開く、またはファイルを開く
      vim.keymap.set('n', '<Right>', api.node.open.edit, opts('Open'))
      -- 左キー: ディレクトリを閉じる、または親ディレクトリに移動して閉じる
      vim.keymap.set('n', '<Left>',  api.node.navigate.parent_close, opts('Close Directory'))

      -- シングルクリックでディレクトリを開閉・ファイルを開く（VS Code風）
      vim.keymap.set('n', '<LeftRelease>', api.node.open.edit, opts('Open'))
    end

    require('nvim-tree').setup({
      on_attach = on_attach,
      update_focused_file = {
        enable = true,
      },
      sort_by = 'case_sensitive',
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
    })

    -- <leader>e でツリーをトグル
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
  end
}