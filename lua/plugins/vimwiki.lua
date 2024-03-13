local home_dir = os.getenv("HOME")
local wiki_path = home_dir .. "/wiki"

return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    'serenevoid/kiwi.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        {
          name = "work",
          path = wiki_path
        }
    },
    keys = {
        { "<leader>ww", ":lua require(\"kiwi\").open_wiki_index()<cr>", desc = "Open Wiki index" },
        { "T", ":lua require(\"kiwi\").todo.toggle()<cr>", desc = "Toggle Markdown Task" }
    },
    lazy = true
  },
}