require("trouble").setup {
    position = "right",
    auto_open = true,
    auto_close = true
}
vim.api.nvim_set_keymap('n', '<leader>xx', ':Trouble<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>xw', ':Trouble workspace_diagnostics<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>xd', ':Trouble document_diagnostics<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>xl', ':Trouble loglist<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>xq', ':Trouble quickfix<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>gR', ':Trouble lsp_references<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>x,', ':lua require("trouble").previous({skip_groups = true, jump = true})<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>x.', ':lua require("trouble").next({skip_groups = true, jump = true})<cr>', {})
