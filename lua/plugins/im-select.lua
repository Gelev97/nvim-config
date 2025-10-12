return {
  "keaising/im-select.nvim",
  lazy = false,
  config = function()
    -- Start with a base/empty options table, which works for Ubuntu
    local opts = {}

    -- Check if the operating system is macOS
    if vim.fn.has('mac') == 1 then
      -- If it's a Mac, overwrite the options with your Mac-specific settings
      opts = {
        default_command = "/opt/homebrew/bin/im-select",
        set_default = true,
      }
    end

    -- Call the setup function with the correct options for the current OS
    require('im_select').setup(opts)
  end,
}
