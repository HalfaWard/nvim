vim.keymap.set('n', '<leader>tz', function()
    require('zen-mode').setup {
        window = {
            width = 100,
            options { }
        },
    }
    require('zen-mode').toggle()
    wim.wo.wrap = false
    ColorIt()
end)

