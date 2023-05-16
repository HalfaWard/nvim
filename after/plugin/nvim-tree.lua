vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = {
            relative = 'editor',
            border = 'rounded',
            width = 30,
            height = 40,
            row = 1,
            col = 1,
        },
    },
})

vim.keymap.set('n', '<Leader>n', ':NvimTreeOpen<CR>')
vim.keymap.set('n', '<Leader>m', ':NvimTreeFindFileToggle<CR>')
