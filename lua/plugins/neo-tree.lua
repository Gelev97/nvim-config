return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})

    require("neo-tree").setup({
      close_if_last_window = true,
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf" },
      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        filtered_items = {
          visible = true,
        },
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function(_)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    })
  end,
}

