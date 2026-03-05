return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()

    -- LSPに補完機能を伝えるための設定
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "intelephense" },
    })

    -- 各LSPサーバーの設定
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.config("intelephense", {
      capabilities = capabilities,
    })

    -- ruby_lspはMasonを使わず、rbenv経由のものを直接使用
    vim.lsp.config("ruby_lsp", {
      capabilities = capabilities,
    })

    vim.lsp.enable({ "lua_ls", "intelephense", "ruby_lsp" })

    -- キーマッピング設定 (LSP機能用)
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- バッファローカルなキーマップを設定
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- 定義ジャンプ
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)       -- ドキュメント表示
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- リネーム
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- コードアクション
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- 参照検索
      end,
    })
  end
}
