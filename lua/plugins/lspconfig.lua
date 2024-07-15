--local opts = { noremap=true, silent=true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


  ---- Mappings.
  ---- See `:help vim.lsp.*` for documentation on any of the below functions
  --local bufopts = { noremap=true, silent=true, buffer=bufnr }
  --vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  --vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wl', function()
  --print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts)
  --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  --vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  --vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  --vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
--end

--local lsp_flags = {
  ---- This is the default in Nvim 0.7+
  --debounce_text_changes = 150,
--}



  --require("mason-lspconfig").setup()
--local lspconfig = require("lspconfig")

---- Enable some language servers with the additional completion capabilities offered by nvim-cmp
----local servers = {"clangd", "pyright", "bashls", "cmake", "rust_analyzer"}
----for _, lsp in ipairs(servers) do
  ----lspconfig[lsp].setup {
    ----capabilities = capabilities
  ----}
----end

--require('lspconfig')['pyright'].setup{
    --on_attach = on_attach,
    --flags = lsp_flags,
--}
--require('lspconfig')['clangd'].setup{
    --on_attach = on_attach,
    --flags = lsp_flags,
--}
--require('lspconfig')['bashls'].setup{
    --on_attach = on_attach,
    --flags = lsp_flags,
--}
--require('lspconfig')['rust_analyzer'].setup{
    --on_attach = on_attach,
    --flags = lsp_flags,
    ---- Server-specific settings...
    --settings = {
        --["rust-analyzer"] = {
            --imports = {
                --granularity = {
                    --group = "module",
                --},
                --prefix = "self",
            --},
            --cargo = {
                --buildScripts = {
                    --enable = true,
                --},
            --},
            --procMacro = {
                --enable = true
            --},
        --}
    --}
--}


----local on_attach = function(client)
    ----require'completion'.on_attach(client)
----end
----

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

local function on_attach(client, buffer)
  -- This callback is called when the LSP is atttached/enabled for this buffer
  -- we could set keymaps related to LSP, etc here.
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

require("rust-tools").setup(opts)

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require("cmp")
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  -- Installed sources
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  },
})



local keymap_opts = { buffer = buffer }
-- Code navigation and shortcuts
vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)

vim.keymap.set("n", ",g", vim.lsp.buf.definition, keymap_opts)
vim.keymap.set("n", ",r", vim.lsp.buf.references, keymap_opts)
vim.keymap.set("n", ",i", vim.lsp.buf.implementation, keymap_opts)
vim.keymap.set("n", ",t", vim.lsp.buf.type_definition, keymap_opts)
vim.keymap.set("n", ",a", vim.lsp.buf.code_action, keymap_opts)
vim.keymap.set("n", ",0", vim.lsp.buf.document_symbol, keymap_opts)
vim.keymap.set("n", ",w", vim.lsp.buf.workspace_symbol, keymap_opts)
vim.keymap.set('n', 'rn', vim.lsp.buf.rename, keymap_opts)


-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
vim.wo.signcolumn = "yes"

-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
vim.opt.updatetime = 100

-- Show diagnostic popup on cursor hover
local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
   vim.diagnostic.open_float(nil, { focusable = false })
  end,
  group = diag_float_grp,
})

-- Goto previous/next diagnostic warning/error
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)







--format-on-write (with a timeout of 200ms)
-- vim.api.nvim_create_autocmd("BufWritePre", {
  -- pattern = "*.rs",
  -- callback = function()
   -- vim.lsp.buf.formatting_sync(nil, 200)
  -- end,
  -- group = format_sync_grp,
-- })
