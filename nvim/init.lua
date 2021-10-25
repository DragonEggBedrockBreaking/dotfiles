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

--Usability options
vim.opt.compatible = false --don't maintain vi compat

-- Autocompletion options
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
map('n', '<silent> <leader>fm', ':NnnExplorer<CR>', {noremap = true, silent = true})

--Formatting code
map('n', '<silent> <leader>fmtc', '<cmd>astyle -xnxcxlxkxVCxGSKNs4A1 %<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>fmtjson', '<cmd>fixjson --write --indent 4 %<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>fmtpy', '<cmd>autopep8 --aggressive --experimental --in-place --max-line-length 100 %<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>fmtrs', '<cmd>rustfmt --unstable-features --emit files %<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>fmtsh', '<cmd>shfmt -w -s -i 4 %<CR>', {noremap = true, silent = true})

--Running code
map('n', '<silent> <leader>bdc', '<cmd>gcc % -o %:r.out<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>bdcpp', '<cmd>g++ % -o %:r.out<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>bdcg', '<cmd>cargo build<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>bdrs', '<cmd>rustc %<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>rnc', '<cmd>gcc % -o %:r.out && ./%:r.out<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>rncpp', '<cmd>g++ % -o %:r.out && ./%:r.out<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>rncg', '<cmd>cargo run<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>rnpy', '<cmd>python %<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>rnrs', '<cmd>rustc % && ./%:r<CR>', {noremap = true, silent = true})


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


-------------
--DEBUGGING--
-------------
-- Setup nvim-dap-python
require('dap-python').setup('/usr/bin/python')

--Setup nvim-dap hotkeys
map('n', '<silent> <leader>c', ':lua require("dap").continue()<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>n', ':lua require"dap".step_over()<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>.', ':lua require"dap".step_into()<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>,', ':lua require"dap".step_out()<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>b', ':lua require"dap".toggle_breakpoint()<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>o', ':lua require"dap".repl.open()<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>v', ':lua require"dap".repl.run_last()<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>t', ':lua require("dap-python").test_method()<CR>', {noremap = true, silent = true})
map('n', '<silent> <leader>d', '<ESC>:lua require("dap-python").debug_selection()<CR>', {noremap = true, silent = true})

-----------
--PLUGINS--
-----------
return require('packer').startup(function()
    use 'wbthomason/packer.nvim' --plugin manager manages itself
    use 'tpope/vim-fugitive' --git inside vim
    use 'luukvbaal/nnn.nvim' --file management inside vim
    use 'mfussenegger/nvim-lint' --syntax checker inside vim
    use 'mfussenegger/nvim-dap' --debugger inside vim
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
    use 'Yggdroot/indentLine' --visual indents
    use 'vim-syntastic/syntastic' --syntax checking, uses whatever is installed
    use 'mangeshrex/uwu.vim' --theme
end)
