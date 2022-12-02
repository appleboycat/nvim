vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {'preservim/nerdcommenter'}

  ----use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
  use {"williamboman/mason.nvim", config = require('plugins.mason')}

  use {"williamboman/mason-lspconfig.nvim"}
  use {'neovim/nvim-lspconfig', config = require('plugins.lspconfig')}

  -- Visualize lsp progress
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  })


  use {"lvimuser/lsp-inlayhints.nvim", 
    config = function() 
        require('lsp-inlayhints').setup()
    end 
  }


  -- jump faster
  use 'ggandor/leap.nvim'
  use 'jinh0/eyeliner.nvim'
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config =
      -- you can configure Hop the way you like here; see :h hop-config
      require('plugins.hop')
      --require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  }



  -- Autocompletion framework
  use("hrsh7th/nvim-cmp")
  use({
    -- cmp LSP completion
    "hrsh7th/cmp-nvim-lsp",
    -- cmp Snippet completion
    "hrsh7th/cmp-vsnip",
    -- cmp Path completion
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    after = { "hrsh7th/nvim-cmp" },
    requires = { "hrsh7th/nvim-cmp" },
  })
  -- auto completion 
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }

  -- See hrsh7th other plugins for more great completion sources!
  -- Snippet engine
  use('hrsh7th/vim-vsnip')

  -- Adds extra functionality over rust analyzer
  --use("simrat39/rust-tools.nvim")
  --use {'simrat39/rust-tools.nvim', config = function() require('cfg/rust-tools') end}
  use {'simrat39/rust-tools.nvim', config = require('plugins.rust-tools') }
  use 'rust-lang/rust.vim'
  --Show function signature when you type
  --use { "ray-x/lsp_signature.nvim" }
  -- Todo >= 0.8.0
  --use {
  --"folke/todo-comments.nvim",
  --requires = "nvim-lua/plenary.nvim",
  --config = function()
    --require("todo-comments").setup {
      ---- your configuration comes here
      ---- or leave it empty to use the default settings
      ---- refer to the configuration section below
    --}
  --end
  --}

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")
        saga.init_lsp_saga({
            -- your configuration
        })
    end,
})

  -- Optional
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use{"nvim-telescope/telescope.nvim", config = require('plugins.telescope')}

  -- Some color scheme other then default
  use("arcticicestudio/nord-vim")
  use 'sainnhe/everforest'
  -- install failed
  --use 'rebelot/kanagawa'
  use "EdenEast/nightfox.nvim"
  -- require setup
  use "catppuccin/nvim"



  use 'ethanholz/nvim-lastplace'



  use "morhetz/gruvbox"
  use "altercation/solarized"

  --vim.cmd("colorscheme solarized")
  vim.cmd("colorscheme gruvbox")
  --vim.cmd("colorscheme everforest")
  --vim.cmd("colorscheme kanagawa")

  -- tab line
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config =  require("plugins.barbar") 
  }
  --use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}


  -- terminal
  use {"akinsho/toggleterm.nvim", tag = '*', config = function() require("toggleterm").setup() end}


  -- status line
  use {"kyazdani42/nvim-web-devicons"}
  --
  use {'nvim-lualine/lualine.nvim', requires = {"kyazdani42/nvim-web-devicons", opt = true}, config = require('plugins.lualine') }
  --
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }



  use "lukas-reineke/indent-blankline.nvim"



  --use {"mhartington/formatter.nvim"}
  use 'sbdchd/neoformat'

  --use 'rafamadriz/friendly-snippets'
  ---- lspkind
  --use 'onsails/lspkind-nvim'




  use 'mfussenegger/nvim-dap'

  use {
    'saecki/crates.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('crates').setup()
    end,
  }
  --
  --use {'simrat39/symbols-outline.nvim', config = function() require("symbols-outline").setup() end}
  use {'simrat39/symbols-outline.nvim', config = require('plugins.symbols-outline')}
  vim.keymap.set('n', '<F9>', ':SymbolsOutline<cr>')
  --use {'preservim/tagbar'}
  --vim.keymap.set('n', '<F9>', ':TagbarToggle<cr>')
  --
  --
  --
  use 'RRethy/vim-illuminate'
-- tagbar
  ----use {'majutsushi/tagbar', 
    ----requires = {
    ------let g:tagbar_ctags_bin='~/.vim/bin/ctags'  " 设置ctags所在路径
    ------let g:tagbar_width=30 " 设置tagbar的宽度
    ------let g:tagbar_left = 1
    ------let g:tagbar_sort=0
    ------let g:tagbar_autofocus=1
    ------let g:tagbar_compact=1
    ------let g:tagbar_autoshowtag=1
    ------
    ----}
  ----}
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  --use {'junegunn/vim-easy-align'}
  --use {'universal-ctags/ctags'}
  --use {'scrooloose/nerdtree'}

  ---- use {'junegunn/fzf.vim'}
   --use {'tpope/vim-surround'}
   --use {'skywind3000/asyncrun.vim'}
  ---- use {'octol/vim-cpp-enhanced-highlight'}
  ---- use {'NoahTheDuke/vim-just'}
   --use {'dense-analysis/ale'}
   --use {'vim-airline/vim-airline'}
   --use {'vim-airline/vim-airline-themes'}
  ---- use {'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}}
  ---- use {'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }}
  ---- use {'linjiX/LeaderF-git'}

  --for git
  --download failed
  use {
    'lewis6991/gitsigns.nvim',
    config = 
      require('plugins.gitsigns')
  }
   --use {'APZelos/blamer.nvim'}
   use 'rhysd/git-messenger.vim'
   use {'tpope/vim-fugitive'}
   --use {'zivyangll/git-blame.vim'}
   use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' , config = function() require(neogit).setup() end}



   --code runner
   use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }
   --require('code_runner').setup({
    ---- put here the commands by filetype
    --filetype = {
          ----java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
          ----python = "python3 -u",
          ----typescript = "deno run",
          --rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
      --},
   --})
    --vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
    --vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
    --vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
    --vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
    --vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
    --vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
    --vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })


  --file explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

end)
