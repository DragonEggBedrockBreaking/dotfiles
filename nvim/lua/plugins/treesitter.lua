require('nvim-treesitter.configs').setup {
    ensure_installed = { 'json', 'json5', 'lua', 'python', 'vim' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}

