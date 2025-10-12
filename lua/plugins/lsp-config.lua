return {
  {
    -- This plugin provides the `:Mason` command.
    -- The `config` function is essential for it to work.
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    -- This plugin is the bridge between mason and lspconfig.
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
  {
    -- This is your main LSP configuration.
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Autocmd to set keymaps when an LSP attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, noremap = true, silent = true }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
        end,
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Tell mason-lspconfig how to set up servers
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "ltex", "marksman", "pyright", "html", "lua_ls" },
        handlers = {
          -- Default handler for servers
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- Custom handler for ltex
          ["ltex"] = function()
            require("lspconfig").ltex.setup({
              capabilities = capabilities,
              filetypes = {
                "bib", "gitcommit", "org", "plaintex", "rst", "rnoweb", "tex",
                "pandoc", "quarto", "rmd", "context", "html", "xhtml",
              },
            })
          end,
        },
      })
    end,
  },
}
