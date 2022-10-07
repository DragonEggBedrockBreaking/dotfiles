require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.astyle.with({
            extra_args = { "-xnxcxlxkxVCxGSKNs4A1" }
        }),
        require("null-ls").builtins.formatting.autopep8.with({
            extra_args = { "-ai", "--experimental", "--max-line-length 79" }
        }),
        require("null-ls").builtins.formatting.fixjson.with({
            extra_args = { "-wi4" }
        }),
        require("null-ls").builtins.formatting.rustfmt.with({
            extra_args = { "--emit files" }
        }),
        require("null-ls").builtins.formatting.shfmt.with({
            extra_args = { "-w", "-s", "-i", "4" }
        })
    }
})

