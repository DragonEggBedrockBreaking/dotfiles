return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- plugin manager manages self
    use { -- better syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('plugins.treesitter')
        end
    }
    use { -- the theme; make background transparent
        'tanvirtin/monokai.nvim',
        config = function()
            require('monokai').setup { palette = require('monokai').soda }
        end
    }
    use { -- fast fuzzy finder
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('plugins.telescope')
        end
    }
    use { -- bottom info line
        'tamton-aquib/staline.nvim',
        config = function()
            require('plugins.staline')
        end
    }
    use { -- buffer line
        'romgrk/barbar.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('plugins.barbar')
        end
    }
    use { -- file manager
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('plugins.nvim-tree')
        end
    }
    use { -- commenting in nvim
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use { -- automatic pairs (braces, quotations, etc)
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {
                check_ts = true
            }
        end
    }
    use { -- highlight where the cursor is
        'yamatsum/nvim-cursorline',
        config = function()
            require('plugins.nvim-cursorline')
        end
    }
    use { -- better gui
        'folke/noice.nvim',
        event = 'VimEnter',
        config = function()
            require('plugins.noice')
        end,
        requires = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify'
        }
    }
    use { -- autocomplete, linting, formatting (aio)
        'VonHeikemen/lsp-zero.nvim',
        config = function()
            require('plugins.lsp-zero')
        end,
        requires = {
            --basic
            'neovim/nvim-lspconfig',
            
            --autoinstall
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            
            --autocomplete
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',

            --gh copilot
            'zbirenbaum/copilot.lua',
            'zbirenbaum/copilot-cmp',

            --folds
            'kevinhwang91/nvim-ufo',
            'kevinhwang91/promise-async',

            --inlay hints
            'simrat39/inlay-hints.nvim',

            --languages
            'simrat39/rust-tools.nvim',
            'p00f/clangd_extensions.nvim'
        }
    }
    use { --visual linting
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('plugins.trouble')
        end
    }
    use { --formatting
        'mhartington/formatter.nvim',
        config = function()
            require('plugins.formatter')
        end
    }
end)
