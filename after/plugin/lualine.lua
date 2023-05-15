require('lualine').setup{
    options = {
        icons_enabled = true,
        theme = 'monokai_pro',
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
