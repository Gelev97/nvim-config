vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.spelllang = 'en_us,cjk'
vim.o.spell = true
vim.g.mapleader = " "

vim.cmd('highlight DiffDelete guifg=red ctermfg=red')

-- Specific setup for wiki .md
vim.cmd('autocmd FileType markdown setlocal nospell')

-- Navigate vim panes better
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', '<c-e>', '<Esc>')
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Toggle spell check
vim.api.nvim_set_keymap('n', '<leader>ts', ':setlocal spell!<CR>', { noremap = true })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true