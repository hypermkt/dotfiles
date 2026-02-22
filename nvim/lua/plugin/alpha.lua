return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- ヘッダー
    dashboard.section.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
      '                                                     ',
    }

    -- ボタン
    dashboard.section.buttons.val = {
      dashboard.button('f', '  Find File',    ':Telescope find_files<CR>'),
      dashboard.button('r', '  Recent Files', ':Telescope oldfiles<CR>'),
      dashboard.button('g', '  Grep Text',    ':Telescope live_grep<CR>'),
      dashboard.button('n', '  New File',     ':enew<CR>'),
      dashboard.button('q', '  Quit',         ':qa<CR>'),
    }

    -- フッター
    dashboard.section.footer.val = 'hypermkt dotfiles'

    alpha.setup(dashboard.config)
  end,
}
