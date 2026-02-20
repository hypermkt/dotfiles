return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    
    -- LSPに補完機能を伝えるための設定
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup({
      -- ここに自動インストールしたい言語サーバーを列挙します
      ensure_installed = { "lua_ls", "ruby_lsp" },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      }
    })
    
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
