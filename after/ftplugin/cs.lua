vim.cmd[[setlocal cinoptions=(1s,J1]]
vim.keymap.set('n', 'gd', require('omnisharp_extended').lsp_definition, {noremap = true, silent = true, desc = "LSP [G]o to [D]efinition csharp"})
vim.keymap.set('n', 'gr', require('omnisharp_extended').lsp_references, {noremap = true, silent = true, desc = "LSP [G]o to [R]eferences csharp"})
vim.keymap.set('n', 'gi', require('omnisharp_extended').lsp_implementation, {noremap = true, silent = true, desc = "LSP [G]o to [I]mplementation csharp"})
vim.keymap.set('n', '<leader>D', require('omnisharp_extended').lsp_type_definition, {noremap = true, silent = true, desc = "LSP TypeDefinition csharp"})
