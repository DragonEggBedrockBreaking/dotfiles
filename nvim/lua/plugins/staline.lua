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
