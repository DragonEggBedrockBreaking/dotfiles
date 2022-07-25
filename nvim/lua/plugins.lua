return require('packer').startup(function()
    use 'wbthomason/packer.nvim' --plugin manager manages itself
    use { -- autocompletion/snippets
        'ms-jpq/coq_nvim',
        branch = 'coq',
        requires = {
            {
                'ms-jpq/coq.artifacts',
                branch = 'artifacts'
            },
            'neovim/nvim-lspconfig'
        },
        config = function()
            vim.g.coq_settings = {
                auto_start = 'shut-up'
            }
            require('lspconfig')['pylsp'].setup(require('coq').lsp_ensure_capabilities({}))
        end
    }
    use { -- better syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 'json', 'json5', 'lua', 'python', 'vim' },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                }
            }
        end
    }
    use { -- debugging
        'mfussenegger/nvim-dap',
        requires = 'mfussenegger/nvim-dap-python',
        config = function()
            require('dap-python').setup('/usr/bin/python3')
        end
    }
    use { -- the theme; make background transparent
        'tanvirtin/monokai.nvim',
        requires = 'xiyaowong/nvim-transparent',
        config = function()
            require('monokai').setup { palette = require('monokai').soda }
            require('transparent').setup { enable = true }
        end
    }
    use { -- fast fuzzy finder
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            local actions = require("telescope.actions")
            local trouble = require("trouble.providers.telescope")
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = { ["<c-t>"] = trouble.open_with_trouble },
                        n = { ["<c-t>"] = trouble.open_with_trouble }
                    }
                }
            }
        end
    }
    use { -- bottom info line
        'tamton-aquib/staline.nvim',
        config = function()
            require('staline').setup {
                sections = {
                    left = {
                        ' ', 'right_sep_double', '-mode', 'left_sep_double', ' ',
                        'right_sep', '-file_name', '-file_size', 'left_sep', ' ',
                        'right_sep_double', '-branch', 'left_sep_double', ' '
                    },
                    mid  = {'lsp'},
                    right= {
                        'right_sep', '-cool_symbol', 'left_sep', ' ',
                        'right_sep_double', '-line_column', 'left_sep_double', ' '
                    }
                },
                mode_colors = {
                    n  = '#181a23',
                    i  = '#00ff7e',
                    ic = '#00c9ff',
                    c  = '#00c9ff',
                    v  = '#d55757'
                }
            }
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
            require('nvim-tree').setup {
                disable_netrw = true,
                hijack_cursor = true,
                open_on_setup_file = true,
                update_cwd = true,
                view = {
                    width = 25,
                    height = 0
                },
                renderer = {
                    indent_markers = {
                        enable = true
                    },
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true
                },
                git = {
                    ignore = false
                }
            }
        end
    }
    use { -- visual indents
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            vim.cmd [[highlight IndentBlankline guifg=#7e7e7e gui=nocombine]]
            require('indent_blankline').setup {
                char = '┆',
                char_highlight_list = {
                    'IndentBlankline'
                }
            }
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
            require('nvim-cursorline').setup {
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true }
                }
            }
        end
    }
    use 'ellisonleao/glow.nvim' -- markdown previewer
    use { -- linting stuff
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                position = "right",
                auto_open = true,
                auto_close = true
            }
        end
    }
    use { -- formatting
        "jose-elias-alvarez/null-ls.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.autopep8.with({
                        extra_args = { "-ai", "--experimental", "--max-line-length 79" }
                    }),
                    require("null-ls").builtins.formatting.fixjson.with({
                        extra_args = { "-wi4" }
                    }),
                    require("null-ls").builtins.formatting.shfmt.with({
                        extra_args = { "-w", "-s", "-i", "4" }
                    })
                }
            })
        end
    }
end)
