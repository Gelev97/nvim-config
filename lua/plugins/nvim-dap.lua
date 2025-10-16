return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "nvim-telescope/telescope-dap.nvim" },
    },

    config = function()
      local dap = require("dap")

      require("telescope").load_extension("dap")

      dap.adapters.cppdbg = { id = "cppdbg", type = "executable", command = "cpp-dap" }
      dap.adapters.python = { type = "executable", command = "python", args = { "-m", "debugpy.adapter" } }

      dap.configurations.python = {}
      dap.configurations.cpp = {}

      require("dap.ext.vscode").load_launchjs(nil, {
        cpp = { "cppdbg" },
        python = { "python" },
      })

      local function find_and_close_dap_terminal()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
            vim.schedule(function()
              vim.cmd('bdelete! ' .. buf)
            end)
          end
        end
      end

      vim.g.mapleader = " "
      vim.keymap.set("n", "<Leader>fb", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>fc", function()
        require("telescope").extensions.dap.configurations({})
      end, { desc = "DAP: Choose & Launch Configuration" })
      vim.keymap.set("n", "<Leader>fr", dap.continue, { desc = "DAP: Run/Continue" })
      vim.keymap.set("n", "<Leader>fo", dap.step_over, { desc = "DAP: Step Over" })
      vim.keymap.set("n", "<Leader>fi", dap.step_into, { desc = "DAP: Step Into" })
      vim.keymap.set("n", "<Leader>fu", dap.step_out, { desc = "DAP: Step Out" })

      vim.keymap.set("n", "<Leader>fq", function()
        dap.terminate()
        dap.repl.close()
        find_and_close_dap_terminal()
      end, { desc = "DAP: Quit/Terminate & Close All Windows" })

      vim.keymap.set("n", "<Leader>fe", dap.repl.open, { desc = "DAP: Open REPL (eval)" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python", "cpp", "c", "rust", "go", "java" },
        callback = function()
          vim.keymap.set("n", "K", function()
            require("dap.ui.widgets").hover()
          end, { buffer = true, desc = "DAP: Hover Variable" })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dap-repl",
        callback = function(args)
          vim.schedule(function()
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              if vim.api.nvim_win_get_buf(win) == args.buf then
                vim.api.nvim_set_current_win(win)
                vim.cmd('startinsert')
                break
              end
            end
          end)
        end,
        desc = "Focus and start insert mode when DAP REPL opens",
      })
    end,
  },
}
