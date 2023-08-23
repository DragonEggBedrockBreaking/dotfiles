require('nvim-tree').setup {
    disable_netrw = true,
    hijack_cursor = true,
    update_cwd = true,
    view = {
        width = 25,
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

require("nvim-tree.api").tree.open()
