require('nvim-tree').setup {
    disable_netrw = true,
    hijack_cursor = true,
    open_on_setup_file = true,
    update_cwd = true,
    view = {
        width = 25,
        height = 0
    },
    renderer = {
        indent_markers = {
            enable = true
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true
    },
    git = {
        ignore = false
    }
}

