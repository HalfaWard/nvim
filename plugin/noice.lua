return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
    opts = function(_, opts)
        opts.commands = {
            all = {
                view = 'split',
                opts = {enter = true, format = 'details'},
                filter = {},
            },
        }
    end,
}
