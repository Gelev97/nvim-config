return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
}