--return function()
  -- print('hello from ~/config/nvim/lua/plugins/mason.lua')
  require("mason").setup()
  local installed_pkgs = require('mason-registry').get_installed_packages()
  local install_confirm = ''
  if #installed_pkgs == -1 then
    install_confirm = vim.fn.input('No LSP installed yet, install default LSP now (use Mason) ? Y/n = ')
  end




  -- require("mason-lspconfig").setup({
    -- ensure_installed = { "sumneko_lua", "rust_analyzer" , "clangd"}
  -- })
  --require("lspconfig").sumneko_lua.setup {}
  --require("lspconfig").rust_analyzer.setup {}
  --require("lspconfig").clangd.setup {}
--end
