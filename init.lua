local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- after Lazy is loaded
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- run Lazy sync silently (no UI)
    require("lazy").sync({ show = false, wait = false })

    -- delay Mason update slightly
    vim.defer_fn(function()
      local ok, mason = pcall(require, "mason.api.command")
      if ok then
        mason.MasonUpdate()
      end
    end, 2000)
  end,
})

