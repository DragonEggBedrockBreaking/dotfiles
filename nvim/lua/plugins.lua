return require('packer').startup(function()
    use 'wbthomason/packer.nvim' --plugin manager manages itself
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
    }
    use { -- file manager
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('plugins.nvim-tree')
        end
    }
    use { -- visual indents
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('plugins.indent-blankline')
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
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            require('plugins.noice')
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        }
    }
end)
