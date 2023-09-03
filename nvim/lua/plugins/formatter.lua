local util = require "formatter.util"

require("formatter").setup({
    filetype = {
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "--style=file"
                    },
                    stdin = true
                }
            end
        },
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "--style=file",
                    },
                    stdin = true
                }
            end
        },
        -- python = {
        --     function()
        --         return {
        --             exe = "autopep8",
        --             args = {
        --                 "-a",
        --                 "--experimental",
        --                 "-"
        --             },
        --             stdin = true
        --         }
        --     end
        -- },
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
        go = {
            function()
                return {
                    exe = "gofmt",
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
        },
        javascript = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        util.get_current_buffer_file_name()
                    },
                    stdin = true
                }
            end
        },
        typescript = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        util.get_current_buffer_file_name()
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
