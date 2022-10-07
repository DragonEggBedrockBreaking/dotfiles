local util = require "formatter.util"

require("formatter").setup({
    filetype = {
        cpp = {
            function()
                return {
                    exe = "astyle",
                    args = {
                        "--style=stroustrup",
                        "--indent=spaces=4",
                        "--indent-modifiers",
                        "--indent-cases",
                        "--break-blocks",
                        "--pad-oper",
                        "--pad-comma",
                        "--break-closing-braces",
                        "--lineend=linux"
                    },
                    stdin = true
                }
            end
        },
        python = {
            function()
                return {
                    exe = "autopep8",
                    args = {
                        "-a",
                        "--experimental",
                        "--max-line-length",
                        "100",
                        "-"
                    },
                    stdin = 1
                }
            end
        },
        json = {
            function()
                return {
                    exe = "fixjson",
                    args = {
                        "-wi4",
                        "--stdin-filename",
                        util.get_current_buffer_file_name()
                    },
                    stdin = true
                }
            end
        },
        rust = {
            function()
                return {
                    exe = "rustfmt",
                    args = {
                        "--emit=stdout"
                    },
                    stdin = true
                }
            end
        },
        sh = {
            function()
                return {
                    exe = "shfmt",
                    args = {
                        "-s",
                        "-i",
                        "4"
                    },
                    stdin = true
                }
            end
        }
    }
})

vim.api.nvim_exec([[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
    augroup END
]],
    true
)
