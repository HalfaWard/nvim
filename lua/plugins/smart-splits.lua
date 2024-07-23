return  {
  'mrjones2014/smart-splits.nvim',
  lazy = false;
  config = function()
    require('smart-splits').setup()
    local set = vim.keymap.set

    -- Resize splits with Alt + hjkl
    set('n', '<A-h>', require('smart-splits').resize_left, { noremap = true, silent = true })
    set('n', '<A-j>', require('smart-splits').resize_down, { noremap = true, silent = true })
    set('n', '<A-k>', require('smart-splits').resize_up, { noremap = true, silent = true })
    set('n', '<A-l>', require('smart-splits').resize_right, { noremap = true, silent = true })

    -- Move windows with Ctrl + hjkl
    set('n', '<C-h>', require('smart-splits').move_cursor_left, { desc = 'Move focus to the left pane', silent = true })
    set('n', '<C-j>', require('smart-splits').move_cursor_down, { desc = 'Move focus to the lower pane', silent = true })
    set('n', '<C-k>', require('smart-splits').move_cursor_up, { desc = 'Move focus to the upper pane', silent = true })
    set('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = 'Move focus to the right pane', silent = true })

    -- Swapping buffers between windows
    set('n', '<leader><leader>h', require('smart-splits').swap_buf_left, { noremap = true, silent = true })
    set('n', '<leader><leader>j', require('smart-splits').swap_buf_down, { noremap = true, silent = true })
    set('n', '<leader><leader>k', require('smart-splits').swap_buf_up, { noremap = true, silent = true })
    set('n', '<leader><leader>l', require('smart-splits').swap_buf_right, { noremap = true, silent = true })
  end
}
