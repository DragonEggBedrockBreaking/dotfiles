-----------
--PLUGINS--
-----------
return require('packer').startup(function()
    use 'wbthomason/packer.nvim' --plugin manager manages itself
    use 'neovim/nvim-lspconfig' --language server protocol in neovim
    use 'hrsh7th/cmp-nvim-lsp' --autocompletion
    use 'hrsh7th/cmp-buffer' --autocompletion
    use 'hrsh7th/nvim-cmp' --autocompletion
    use { 'zbirenbaum/copilot-cmp', requires = 'zbirenbaum/copilot.lua' } --github copilot
    use 'L3MON4D3/LuaSnip' --snippets
    use 'saadparwaiz1/cmp_luasnip' --snippets
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } --better syntax highlighting
    use 'mfussenegger/nvim-dap' --debugger
    use 'mfussenegger/nvim-dap-python' --python debugger
    use 'ellisonleao/glow.nvim' --markdown previewer
    use 'mg979/vim-visual-multi' --multiple cursors
    use 'lukas-reineke/indent-blankline.nvim' --visual indents
    use 'numToStr/Comment.nvim' --commenting in nvim
    use 'tanvirtin/monokai.nvim' --theme
    use 'github/copilot.vim' --(ONLY NEEDED TO INSTALL NECESSARY FILES, CAN BE DELETED AFTER FIRST INSTALL)
    use 'editorconfig/editorconfig-vim' --editorconfig
    use 'windwp/nvim-autopairs' --automatic pairs
    use 'nvim-lua/popup.nvim' --common functions
    use 'nvim-lua/plenary.nvim' --common functions
    use 'nvim-telescope/telescope.nvim' --nvim telescope
    use 'jvgrootveld/telescope-zoxide' --zoxide inside nvim telescope
    use 'yamatsum/nvim-cursorline' --highlights where the cursor is, and the same keyword
    use 'xiyaowong/nvim-transparent' --makes the background transparent
    use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons' } --bufferline
    use 'tamton-aquib/staline.nvim' --tabline
    use 'jghauser/mkdir.nvim' --auto mkdir
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' } -- file manager
end)
