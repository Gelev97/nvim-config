return {
    "keaising/im-select.nvim",
    lazy = false,
    config = function()
        require('im_select').setup({
            default_command = "/opt/homebrew/bin/im-select",
            set_default = true,  -- optional: set default input method
        })
    end,
}

