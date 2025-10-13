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

    -- delay Mason and Treesitter updates slightly
    vim.defer_fn(function()
      local mr_ok, mason_registry = pcall(require, "mason-registry")

      if not mr_ok then
        return -- if mason-registry is not found, do nothing
      end

      -- Step 1: Update the registry
      vim.cmd.MasonUpdate()

      -- Step 2: Get a list of all installed packages
      local installed_packages = mason_registry.get_installed_packages()
      if #installed_packages == 0 then
        return -- No packages to update
      end

      vim.notify("Mason: Updating packages...", vim.log.levels.INFO)

      -- Step 3: Loop through the packages and install/update each one
      for _, pkg in ipairs(installed_packages) do
        pkg:install() -- :install() is smart and will update if already installed
      end

      vim.notify("Mason: All packages are up to date.", vim.log.levels.INFO)

      -- Also update Treesitter parsers
      vim.cmd("TSUpdate")
    end, 2000)
  end,
})
