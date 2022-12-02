--require('cfg/rust-tools')
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      -- Open Cargo.toml 
      vim.keymap.set("n", "<Leader>ct", rt.open_cargo_toml.open_cargo_toml, { buffer = bufnr })
      -- Open Parent Module
      vim.keymap.set("n", "<Leader>prt", rt.parent_module.parent_module, { buffer = bufnr })
    end,
  },
  inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = false,
  }
})
