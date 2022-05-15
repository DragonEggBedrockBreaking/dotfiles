-----------
--PLUGINS--
-----------
return require('packer').startup(function()
    use 'wbthomason/packer.nvim' --plugin manager manages itself
    use { -- autocompletion/snippets/copilot
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'neovim/nvim-lspconfig',
            {
                'zbirenbaum/copilot-cmp',
                requires = 'zbirenbaum/copilot.lua'
            },
            {
                'saadparwaiz1/cmp_luasnip',
                requires = 'L3MON4D3/LuaSnip' 
            }
        }
    }
    use { -- better syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate' 
    }
    use { -- debugging
        'mfussenegger/nvim-dap',
        requires = 'mfussenegger/nvim-dap-python'
    }
    use { -- the theme; make background transparent
        'tanvirtin/monokai.nvim',
        requires = 'xiyaowong/nvim-transparent'
    }
    use { -- fast fuzzy finder
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use { -- buffer line and bottom info line
        'tamton-aquib/staline.nvim',
        requires = {
            'romgrk/barbar.nvim',
            requires = 'kyazdani42/nvim-web-devicons'
        }
    }
    use { -- file manager
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'ellisonleao/glow.nvim' --markdown previewer
    use 'lukas-reineke/indent-blankline.nvim' --visual indents
    use 'numToStr/Comment.nvim' --commenting in nvim
    use 'editorconfig/editorconfig-vim' --editorconfig
    use 'windwp/nvim-autopairs' --automatic pairs
    use 'yamatsum/nvim-cursorline' --highlights where the cursor is
    use 'jghauser/mkdir.nvim' --auto mkdir
end)