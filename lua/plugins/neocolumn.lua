return {
    "ecthelionvi/NeoColumn.nvim",
    config = function()
        require("NeoColumn").setup({
            fg_color = "",
            bg_color = "",
            NeoColumn = {"80", "120"},
            always_on = false,
            excluded_ft = {"text", "markdown"}
        })
        vim.keymap.set("n", "<leader>nc", "<cmd>ToggleNeoColumn<cr>")
    end,
}
