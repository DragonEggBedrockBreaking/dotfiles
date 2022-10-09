require("noice").setup {
    cmdline = {
        view = "cmdline"
    },
    notify = {
        enabled = true
    }
}
require("telescope").load_extension("noice")
