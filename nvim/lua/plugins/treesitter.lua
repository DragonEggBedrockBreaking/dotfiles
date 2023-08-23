require('nvim-treesitter.configs').setup {
    ensure_installed = { 'c', 'cpp', 'css', 'c_sharp', 'go', 'html', 'java', 'javascript', 'json', 'json5', 'latex', 'lua', 'python', 'rust', 'sql', 'typescript' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}
