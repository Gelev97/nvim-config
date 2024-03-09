return {
    "ntpeters/vim-better-whitespace",
    config = function()
        -- remove trailing whitespace with a keybinding
        vim.keymap.set("n", "<leader>tw", "<cmd>StripWhitespace<cr>")
    end,
}

