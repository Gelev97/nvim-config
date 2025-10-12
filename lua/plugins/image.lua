return {
  "3rd/image.nvim",
  build = false,
  opts = {
    backend = "kitty",
    processor = "magick_cli",
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = 100,
    max_height_window_percentage = 100,
    scale_factor = 1.0,
    window_overlap_clear_enabled = true,
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
  },
  init = function()
    vim.api.nvim_create_autocmd("VimResized", {
      callback = function()
        require("image").redraw()
      end,
    })
    vim.api.nvim_create_autocmd("BufWinEnter", {
      pattern = "*",
      callback = function()
        vim.opt_local.fillchars = "eob: "
      end,
    })
  end,
}
