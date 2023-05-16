local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    'rust_analyzer',
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd',           function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K',            function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws',  function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd',   function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d',           function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d',           function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca',  function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr',  function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn',  function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>',        function() vim.lsp.buf.signature_help() end, opts)
end)

-- Fix Undefined global 'vim'
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
    }
})

