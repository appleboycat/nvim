local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fa', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>fr', builtin.old_files, {})
--vim.keymap.set('n', '<leader>fm', builtin.key_maps, {})

vim.keymap.set('n', '<leader>gi', builtin.lsp_incoming_calls	, {})--Lists LSP incoming calls for word under the cursor
vim.keymap.set('n', '<leader>go', builtin.lsp_outgoing_calls	, {})--Lists LSP outgoing calls for word under the cursor
vim.keymap.set('n', '<leader>gf', builtin.lsp_document_symbols	, {})--Lists LSP document symbols in the current buffer
vim.keymap.set('n', '<leader>gs', builtin.lsp_workspace_symbols	, {})--Lists LSP document symbols in the current workspace
vim.keymap.set('n', '<leader>gss', builtin.lsp_dynamic_workspace_symbols	, {})--Dynamically Lists LSP for all workspace symbols
vim.keymap.set('n', '<leader>dg', builtin.diagnostics	        , {})--Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.
--already defined in lspconfig.lua
--vim.keymap.set('n', '<leader>r', builtin.lsp_references	    , {})--Lists LSP references for word under the cursor
--vim.keymap.set('n', '<leader>i', builtin.lsp_implementations	, {})
----Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope
--vim.keymap.set('n', '<leader>d', builtin.lsp_definitions	    , {})--Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
--vim.keymap.set('n', '<leader>t', builtin.lsp_type_definitions  , {})--Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope
