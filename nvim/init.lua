----------------
--COLOURSCHEME--
----------------
vim.cmd[[colorscheme uwu]]


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

--nnn mapping
require("nnn").setup()
map('n', 'nnn', ':NnnExplorer<CR>', {noremap = true, silent = true})

--Formatting code
map('n', 'fc', ':!astyle -xnxcxlxkxVCxGSKNs4A1 %<CR>', {noremap = true, silent = true})
map('n', 'fjson', ':!fixjson --write --indent 4 %<CR>', {noremap = true, silent = true})
map('n', 'fpy', ':!autopep8 --aggressive --experimental --in-place --max-line-length 100 %<CR>', {noremap = true, silent = true})
map('n', 'frs', ':!rustfmt --unstable-features --emit files %<CR>', {noremap = true, silent = true})
map('n', 'fsh', ':!shfmt -w -s -i 4 %<CR>', {noremap = true, silent = true})

--Running code
map('n', 'bcc', ':!gcc % -o %:r.out<CR>', {noremap = true, silent = true})
map('n', 'bcpp', ':!g++ % -o %:r.out<CR>', {noremap = true, silent = true})
map('n', 'bcg', ':!cargo build<CR>', {noremap = true, silent = true})
map('n', 'brs', ':!rustc %<CR>', {noremap = true, silent = true})
map('n', 'rcc', ':!gcc % -o %:r.out && ./%:r.out<CR>', {noremap = true, silent = true})
map('n', 'rcpp', ':!g++ % -o %:r.out && ./%:r.out<CR>', {noremap = true, silent = true})
map('n', 'rcg', ':!cargo run<CR>', {noremap = true, silent = true})
map('n', 'rpy', ':!python %<CR>', {noremap = true, silent = true})
map('n', 'rrs', ':!rustc % && ./%:r<CR>', {noremap = true, silent = true})


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


-----------------------
--SYNTAX HIGHLIGHTING--
-----------------------
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
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
    use 'luukvbaal/nnn.nvim' --file management inside vim
    use 'neovim/nvim-lspconfig' --language server protocol in neovim
    use 'hrsh7th/cmp-nvim-lsp' --autocompletion
    use 'hrsh7th/cmp-buffer' --autocompletion
    use 'hrsh7th/nvim-cmp' --autocompletion
    use 'L3MON4D3/LuaSnip' --snippets
    use 'saadparwaiz1/cmp_luasnip' --snippets
    use 'nvim-treesitter/nvim-treesitter' --better syntax highlighting
    use 'mfussenegger/nvim-dap' --debugger
    use 'mfussenegger/nvim-dap-python' --python debugger
    use 'ellisonleao/glow.nvim' --markdown previewer
    use 'mg979/vim-visual-multi' --multiple cursors
    use 'lukas-reineke/indent-blankline.nvim' --visual indents
    use 'mangeshrex/uwu.vim' --theme
    use 'numToStr/Comment.nvim' --commenting in nvim
    use 'glepnir/galaxyline.nvim' --status line
    use 'dense-analysis/ale' --syntax checking
end)
