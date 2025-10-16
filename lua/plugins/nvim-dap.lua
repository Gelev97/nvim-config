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

      -- ===================================================================
      -- NEW: Clear existing configurations before loading from file
      -- This is the definitive fix for duplicate entries.
      dap.configurations.python = {}
      dap.configurations.cpp = {}
      -- ===================================================================

      require("dap.ext.vscode").load_launchjs(nil, {
        cpp = { "cppdbg" },
        python = { "python" },
      })

      -- Your '<Leader>f' keymaps
      vim.g.mapleader = " "
      vim.keymap.set("n", "<Leader>fb", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>fc", function()
        require("telescope").extensions.dap.configurations({})
      end, { desc = "DAP: Choose & Launch Configuration" })
      vim.keymap.set("n", "<Leader>fr", dap.continue, { desc = "DAP: Run/Continue" })
      vim.keymap.set("n", "<Leader>fo", dap.step_over, { desc = "DAP: Step Over" })
      vim.keymap.set("n", "<Leader>fi", dap.step_into, { desc = "DAP: Step Into" })
      vim.keymap.set("n", "<Leader>fu", dap.step_out, { desc = "DAP: Step Out" })
      vim.keymap.set("n", "<Leader>fq", dap.terminate, { desc = "DAP: Quit/Terminate" })
    end,
  },
}
