-----------
--OPTIONS--
-----------
--Indentation options
vim.opt.autoindent = true --inherited indentation
vim.opt.expandtab = true --tabs to spaces
vim.opt.shiftwidth = 4 --tabs are 4 spaces when shifting
vim.opt.smarttab = true --use tabstop for tabbing
vim.opt.tabstop = 4 --indent with 4 spaces

--Search options
vim.opt.ignorecase = true --ignore case
vim.opt.smartcase = true --unless there is a capital letter

--Performance options
vim.opt.lazyredraw = true --don't update screen during macro and script execution
vim.opt.ttyfast = true --also improves performance in vim

--Text rendering
vim.opt.encoding = 'utf-8' --use utf-8
vim.opt.wrap = true --enable line wrapping
vim.opt.linebreak = true --avoid wrapping a line in the middle of a word

--User interface
vim.opt.ruler = true --show cursor permission
vim.opt.number = true --line numbers
vim.opt.errorbells = false --disable beep on errors
vim.opt.title = true --window title to filename
vim.opt.background = 'dark' --use better colours for dark theme

--Backups
vim.opt.backup = false --no backups as I have git
vim.opt.wb = false --ignores it if it fails to write buffer
vim.opt.swapfile = false --remove swap files

--Other options
vim.opt.compatible = false --don't maintain vi compatibility
vim.opt.completeopt = {'menu', 'menuone', 'noselect'} --completion options
vim.opt.termguicolors = true --helps syntax highlighting
vim.opt.laststatus = 2 --status line stuff


-----------
--KEYMAPS--
-----------
--Keymapping function
local map = vim.api.nvim_set_keymap

-- formatting code
map('n', 'fc', ':!astyle -xnxcxlxkxVCxGSKNs4A1 %<CR>', {noremap = true}) -- C
map('n', 'fjson', ':!fixjson -wi4 %<CR>', {noremap = true}) -- Json
map('n', 'fpy', ':!autopep8 -ai --experimental  --max-line-length 100 %<CR>', {noremap = true}) -- Python
map('n', 'frs', ':!rustfmt --emit files %<CR>', {noremap = true}) -- Rust
map('n', 'fsh', ':!shfmt -w -s -i 4 %<CR>', {noremap = true}) -- Shell

-- building code
map('n', 'bcc', ':!gcc -g -O3 -std=c17 -B/usr/bin/mold % -o %:r.out<CR>', {noremap = true}) -- C (one file)
map('n', 'bacc', ':!gcc -g -O3 -std=c17 -B/usr/bin/mold *.c -o %:r.out<CR>', {noremap = true}) -- C (all files)
map('n', 'bcpp', ':!g++ -g -O3 -std=c++20 -B/usr/bin/mold % -o %:r.out<CR>', {noremap = true}) -- C++ (one file)
map('n', 'bacpp', ':!g++ -g -O3 -std=c++20 -B/usr/bin/mold *.cpp -o %:r.out<CR>', {noremap = true}) -- C++ (all files)
map('n', 'bcg', ':!cargo build --release<CR>', {noremap = true}) -- Rust (with cargo)
map('n', 'brs', ':!rustc -C opt-level=3 %<CR>', {noremap = true}) -- Rust (with rustc)

-- running code
map('n', 'rcc', ':!gcc -g -O3 -std=c17 -B/usr/bin/mold % -o %:r.out; ./%:r.out<CR>', {noremap = true}) -- C (one file)
map('n', 'racc', ':!gcc -g -O3 -std=c17 -B/usr/bin/mold *.c -o %:r.out; ./%:r.out<CR>', {noremap = true}) -- C (all files)
map('n', 'rcpp', ':!g++ -g -O3 -std=c++20 -B/usr/bin/mold % -o %:r.out; ./%:r.out<CR>', {noremap = true}) -- C++ (one file)
map('n', 'racpp', ':!g++ -g -O3 -std=c++20 -B/usr/bin/mold *.cpp -o %:r.out; ./%:r.out<CR>', {noremap = true}) -- C++ (all files)
map('n', 'rpy', ':!python3 %<CR>', {noremap = true}) -- Python (normal interpreter)
map('n', 'rpp', ':!pypy3 %<CR>', {noremap = true}) -- Python (pypy)
map('n', 'rcg', ':!cargo run --release<CR>', {noremap = true}) -- Rust (with cargo)
map('n', 'rrs', ':!rustc -C opt-level=3 %; ./%:r<CR>', {noremap = true}) -- Rust (with rustc)

-- nvim-dap (debugging)
map('n', '<leader>c', ':lua require("dap").continue()<CR>', {noremap = true})
map('n', '<leader>n', ':lua require("dap").step_over()<CR>', {noremap = true})
map('n', '<leader>.', ':lua require("dap").step_into()<CR>', {noremap = true})
map('n', '<leader>,', ':lua require("dap").step_out()<CR>', {noremap = true})
map('n', '<leader>b', ':lua require("dap").toggle_breakpoint()<CR>', {noremap = true})
map('n', '<leader>o', ':lua require("dap").repl.open()<CR>', {noremap = true})
map('n', '<leader>v', ':lua require("dap").repl.run_last()<CR>', {noremap = true})
map('n', '<leader>t', ':lua require("dap-python").test_method()<CR>', {noremap = true})
map('n', '<leader>d', '<ESC>:lua require("dap-python").debug_selection()<CR>', {noremap = true})

-- telescope (fuzzy finder)
map('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<cr>', {noremap = true})
map('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<cr>', {noremap = true})
map('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<cr>', {noremap = true})
map('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<cr>', {noremap = true})


-- barbar (top bar)
map('n', '<A-,>', ':BufferPrevious<CR>', { noremap = true })
map('n', '<A-.>', ':BufferNext<CR>', { noremap = true })
map('n', '<A-<>', ':BufferMovePrevious<CR>', { noremap = true })
map('n', '<A->>', ' :BufferMoveNext<CR>', { noremap = true })
map('n', '<A-1>', ':BufferGoto 1<CR>', { noremap = true })
map('n', '<A-2>', ':BufferGoto 2<CR>', { noremap = true })
map('n', '<A-3>', ':BufferGoto 3<CR>', { noremap = true })
map('n', '<A-4>', ':BufferGoto 4<CR>', { noremap = true })
map('n', '<A-5>', ':BufferGoto 5<CR>', { noremap = true })
map('n', '<A-6>', ':BufferGoto 6<CR>', { noremap = true })
map('n', '<A-7>', ':BufferGoto 7<CR>', { noremap = true })
map('n', '<A-8>', ':BufferGoto 8<CR>', { noremap = true })
map('n', '<A-9>', ':BufferGoto 9<CR>', { noremap = true })
map('n', '<A-0>', ':BufferLast<CR>', { noremap = true })
map('n', '<A-c>', ':BufferClose<CR>', { noremap = true })
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', { noremap = true })
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', { noremap = true })
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', { noremap = true })


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
        },
        config = function()
            local cmp = require 'cmp'
            cmp.setup {
                snippet = {
                    expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'copilot' },
                }, {
                    { name = 'buffer' },
                })
            }
            local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
                require('lspconfig')['clangd'].setup {
                    capabilities = capabilities
                }
                require('lspconfig')['pylsp'].setup {
                    capabilities = capabilities
                }
                require('lspconfig')['rust_analyzer'].setup {
                    capabilities = capabilities
                }
            require("copilot").setup {
                plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer", 
                server_opts_overrides = {},
                ft_disable = {}
            }
        end
    }
    use { -- better syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
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
            require('dap-python').setup('/usr/bin/python')
            local dap = require('dap')
            dap.adapters.lldb = {
                type = 'executable',
                command = '/usr/bin/lldb-vscode',
                name = "lldb"
            }
            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() ..  '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                    runInTerminal = true,
                },
            }
            dap.configurations.cpp = dap.configurations.c
            dap.configurations.rust = dap.configurations.c
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
            require('telescope').setup()
        end
    }
    use { -- buffer line and bottom info line
        'tamton-aquib/staline.nvim',
        requires = {
            'romgrk/barbar.nvim',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function()
                vim.g.bufferline = {
                    animation = true,
                    auto_hide = false,
                    tabpages = false,
                    closable = true,
                    clickable = true,
                    exclude_ft = {},
                    exclude_name = {},
                    icons = true,
                    icon_custom_colors = true,
                    icon_separator_active = '▎',
                    icon_separator_inactive = '▎',
                    icon_close_tab = '',
                    icon_close_tab_modified = '●',
                    icon_pinned = '車',
                    insert_at_end = false,
                    insert_at_start = false,
                    maximum_padding = 3,
                    maximum_length = 20,
                    semantic_letters = true,
                    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
                    no_name_title = nil,
                }
            end
        },
        config = function()
            require('staline').setup {
                sections = {
                    left = {
                        ' ', 'right_sep_double', '-mode', 'left_sep_double', ' ',
                        'right_sep', '-file_name', '-file_size', 'left_sep', ' ',
                        'right_sep_double', '-branch', 'left_sep_double', ' ',
                    },
                    mid  = {'lsp'},
                    right= {
                        'right_sep', '-cool_symbol', 'left_sep', ' ',
                        'right_sep_double', '-line_column', 'left_sep_double', ' ',
                    }
                },

                defaults={
                    fg = "#4633ff",
                    cool_symbol = "  ",
                    left_separator = "",
                    right_separator = "",
                    true_colors = true,
                    line_column = "[%l:%c] 並 %p%% ",
                    font_active = "bold",
                },
                mode_colors = {
                    n  = "#181a23",
                    i  = "#00ff7e",
                    ic = "#00c9ff",
                    c  = "#00c9ff",
                    v  = "#d55757"
                }
            }
        end
    }
    use { -- file manager
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
			require("nvim-tree").setup {
				auto_reload_on_write = false,
				disable_netrw = true,
				hijack_cursor = true,
				hijack_netrw = true,
				hijack_unnamed_buffer_when_opening = false,
				ignore_buffer_on_setup = false,
				open_on_setup = false,
				open_on_setup_file = true,
				open_on_tab = false,
				sort_by = "name",
				update_cwd = true,
				view = {
					width = 25,
					height = 0,
					hide_root_folder = false,
					side = "left",
					preserve_window_proportions = false,
					number = false,
					relativenumber = false,
					signcolumn = "yes",
					mappings = {
						custom_only = false,
						list = {
							-- user mappings go here
						},
					},
				},
				renderer = {
					indent_markers = {
						enable = true,
						icons = {
							corner = "└ ",
							edge = "│ ",
							none = "    ",
						},
					},
					icons = {
						webdev_colors = true,
					},
				},
				hijack_directories = {
					enable = true,
					auto_open = true,
				},
				update_focused_file = {
					enable = false,
					update_cwd = false,
					ignore_list = {},
				},
				ignore_ft_on_setup = {},
				system_open = {
					cmd = "",
					args = {},
				},
				diagnostics = {
					enable = true,
					show_on_dirs = true,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				filters = {
					dotfiles = false,
					custom = {},
					exclude = {},
				},
				git = {
					enable = true,
					ignore = false,
					timeout = 400,
				},
				actions = {
					use_system_clipboard = true,
					change_dir = {
						enable = true,
						global = false,
						restrict_above_cwd = false,
					},
					open_file = {
						quit_on_open = false,
						resize_window = false,
						window_picker = {
							enable = true,
							chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
							exclude = {
								filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
								buftype = { "nofile", "terminal", "help" },
							},
						},
					},
				},
				trash = {
					cmd = "trash",
					require_confirm = true,
				},
				log = {
					enable = false,
					truncate = false,
					types = {
						all = false,
						config = false,
						copy_paste = false,
						diagnostics = false,
						git = false,
						profile = false,
					},
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
            require'nvim-autopairs'.setup {
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
                    number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                }
            }
        end
    }
    use 'ellisonleao/glow.nvim' -- markdown previewer
    use 'gpanders/editorconfig.nvim' -- editorconfig
    use 'jghauser/mkdir.nvim' -- auto mkdir
end)
