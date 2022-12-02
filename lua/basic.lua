-- print('hello from ~/config/nvim/lua/basic.lua')

local set = vim.opt
set.number = true
--set.cursorline = true
set.showmode = true
--set.ignorecase = true
vim.opt.ignorecase.smartcase = true
set.hlsearch = true

-- Set the behavior of tab
set.tabstop = 4
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true 
-- print(vim.opt.autoindent)
-- print(vim.opt.autoindent:get())
-- print(vim.inspect(vim.opt.autoindent))
vim.opt.cursorline = true
vim.opt.wildignore = {'*/cache/*', '*/tmp/*'}

vim.opt.errorformat = vim.opt.errorformat + '%f|%l col %c|%m'
-- vim.opt.errorformat:append('%f|%l col %c|%m')
vim.opt.listchars = {eol = '<', tab = '> ', trail = '*'}
vim.g.mapleader = ','


local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<tab>', ":bp<cr>", opts)
vim.keymap.set('n', '<S-tab>', ":bn<cr>", opts)
vim.keymap.set('n', '<C-q>', ":bd<cr>", opts)
--nmap <tab> :bn<cr>
--nmap <S-tab> :bp<cr>
--nmap <C-q> :bd<cr>

