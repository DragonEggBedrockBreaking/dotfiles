require('nvim-treesitter.configs').setup {
    ensure_installed = { 'cpp', 'json', 'json5', 'lua', 'python', 'rust', 'vim' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}

