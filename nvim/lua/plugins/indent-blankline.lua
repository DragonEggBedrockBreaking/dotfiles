vim.cmd [[highlight IndentBlankline guifg=#7e7e7e gui=nocombine]]
require('indent_blankline').setup {
    char = '┆',
    char_highlight_list = {
        'IndentBlankline'
    }
}
