----------------
--COLOURSCHEME--
----------------
require('monokai').setup { palette = require('monokai').soda }
vim.cmd([[
augroup TransparentColours
autocmd!
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
augroup end
]])


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


-----------
--KEYMAPS--
-----------
--Keymapping function
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--fm mapping
map('n', '<leader>nt', ':NERDTree<CR>', {noremap = true, silent = true})

--Formatting code
map('n', 'fc', ':!astyle -xnxcxlxkxVCxGSKNs4A1 %<CR>', {noremap = true, silent = true}) --Use astyle to format c code
map('n', 'fjson', ':!fixjson -wi4 %<CR>', {noremap = true, silent = true}) --Use fixjson to fix/format json
map('n', 'fpy', ':!autopep8 -ai --experimental  --max-line-length 100 %<CR>', {noremap = true, silent = true}) --Use autopep8 to format python code
map('n', 'frs', ':!rustfmt --emit files %<CR>', {noremap = true, silent = true}) --Use rustfmt to format rust code
map('n', 'fsh', ':!shfmt -w -s -i 4 %<CR>', {noremap = true, silent = true}) --Use shfmt to format sh code, e.g. the .zshrc or .bashrc (doesn't work with fish)
map('n', 'fzig', ':!zig fmt --color on --stdin %<CR>', {noremap = true, silent = true}) --Use zig fmt to format zig code

--Building code
map('n', 'bcc', ':!clang -g -O3 -fuse-ld=mold % -o %:r.out<CR>', {noremap = true, silent = true}) --Builds c code with clang
map('n', 'bcpp', ':!clang++ -g -O3 -fuse-ld=mold % -o %:r.out<CR>', {noremap = true, silent = true}) --Builds c++ code with clang++
map('n', 'bcg', ':!cargo build --release<CR>', {noremap = true, silent = true}) --Builds rust code with cargo
map('n', 'brs', ':!rustc -C opt-level=3 %<CR>', {noremap = true, silent = true}) --Builds rust code with rustc
map('n', 'bzig', ':!zig build %<CR>', {noremap = true, silent = true}) --Builds zig code with zig build

--Running code
map('n', 'rcc', ':!clang -g -O3 -fuse-ld=mold % -o %:r.out && ./%:r.out<CR>', {noremap = true, silent = true}) --Builds and runs c code with clang
map('n', 'rcpp', ':!clang++ -g -O3 -fuse-ld=mold % -o %:r.out && ./%:r.out<CR>', {noremap = true, silent = true}) --Builds and runs c++ code with clang++
map('n', 'rcg', ':!cargo run --release<CR>', {noremap = true, silent = true}) --Builds and runs rust code with cargo run
map('n', 'rpy', ':!python3 %<CR>', {noremap = true, silent = true}) --Runs python code with python3
--map('n', 'rpp', ':!pypy3 %<CR>', {noremap = true, silent = true}) --Runs optimised python code with pypy3
map('n', 'rrs', ':!rustc -C opt-level=3% && ./%:r<CR>', {noremap = true, silent = true}) --Builds and runs rust code with rustc
map('n', 'bzig', ':!zig build run %<CR>', {noremap = true, silent = true}) --Runs zig code with zig run



------------------
--AUTOCOMPLETION--
------------------
--Setup cmp
local cmp = require'cmp'
cmp.setup({
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
    }, {
        { name = 'buffer' },
    })
})

-- Setup lspconfig.
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
    require('lspconfig')['zls'].setup {
        capabilities = capabilities
    }


---------------------------------------------
--SYNTAX HIGHLIGHTING AND AUTOMATIC PAIRING--
---------------------------------------------
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}
require'nvim-autopairs'.setup {
    check_ts = true
}


------------------
--VISUAL INDENTS--
------------------
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlankline guifg=#7e7e7e gui=nocombine]]
require('indent_blankline').setup {
    char = '┆',
    char_highlight_list = {
        'IndentBlankline',
    },
}


-------------
--DEBUGGING--
-------------
-- Setup nvim-dap-python
require('dap-python').setup('/usr/bin/python')

-- Setup dap for c/c++/rust
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

--Setup nvim-dap hotkeys
map('n', '<leader>c', ':lua require("dap").continue()<CR>', {noremap = true, silent = true})
map('n', '<leader>n', ':lua require"dap".step_over()<CR>', {noremap = true, silent = true})
map('n', '<leader>.', ':lua require"dap".step_into()<CR>', {noremap = true, silent = true})
map('n', '<leader>,', ':lua require"dap".step_out()<CR>', {noremap = true, silent = true})
map('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>', {noremap = true, silent = true})
map('n', '<leader>o', ':lua require"dap".repl.open()<CR>', {noremap = true, silent = true})
map('n', '<leader>v', ':lua require"dap".repl.run_last()<CR>', {noremap = true, silent = true})
map('n', '<leader>t', ':lua require("dap-python").test_method()<CR>', {noremap = true, silent = true})
map('n', '<leader>d', '<ESC>:lua require("dap-python").debug_selection()<CR>', {noremap = true, silent = true})


----------------
--FUZZY FUNDER--
----------------
require('telescope').setup()
map('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<cr>')
map('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<cr>')
map('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<cr>')
map('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<cr>')


--------------
--COMMENTING--
--------------
require('Comment').setup()


---------------
--STATUS LINE--
---------------
local colors = require('galaxyline.theme').default
require('galaxyline').section.left[1] = {
    FileName = {
        provider = 'FileName',
        highlight = {colors.cyan},
    },
    FileEncode = {
        provider = 'FileEncode',
        highlight = {colors.blue},
    },
    FileSize = {
        provider = 'FileSize',
        highlight = {colors.magenta},
    },
}
require('galaxyline').section.mid[1] = {
    GitBranch = {
        provider = 'GitBranch',
        highlight = {colors.green},
    },
}
require('galaxyline').section.right[1] = {
    LineColumn = {
        provider = 'LineColumn',
        highlight = {colors.red},
    },
    LinePercent = {
        provider = 'LinePercent',
        highlight = {colors.orange},
    },
}

-----------
--PLUGINS--
-----------
return require('packer').startup(function()
    use 'wbthomason/packer.nvim' --plugin manager manages itself
    use 'preservim/nerdtree' --file management inside neovim
    use 'tiagofumo/vim-nerdtree-syntax-highlight' --syntax highlighting file management
    use 'neovim/nvim-lspconfig' --language server protocol in neovim
    use 'hrsh7th/cmp-nvim-lsp' --autocompletion
    use 'hrsh7th/cmp-buffer' --autocompletion
    use 'hrsh7th/nvim-cmp' --autocompletion
    use 'L3MON4D3/LuaSnip' --snippets
    use 'saadparwaiz1/cmp_luasnip' --snippets
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } --better syntax highlighting
    use 'mfussenegger/nvim-dap' --debugger
    use 'mfussenegger/nvim-dap-python' --python debugger
    use 'ellisonleao/glow.nvim' --markdown previewer
    use 'mg979/vim-visual-multi' --multiple cursors
    use 'lukas-reineke/indent-blankline.nvim' --visual indents
    use 'numToStr/Comment.nvim' --commenting in nvim
    use 'glepnir/galaxyline.nvim' --status line
    use 'tanvirtin/monokai.nvim' --theme
    use 'github/copilot.vim' --github copilot
    use 'editorconfig/editorconfig-vim' --editorconfig
    use 'windwp/nvim-autopairs' --automatic pairs
    use 'nvim-lua/popup.nvim' --common functions
    use 'nvim-lua/plenary.nvim' --common functions
    use 'nvim-telescope/telescope.nvim' --nvim telescope
    use 'jvgrootveld/telescope-zoxide' --zoxide inside nvim telescope
    use 'yamatsum/nvim-cursorline' --highlights where the cursor is, and the same keyword
end)
