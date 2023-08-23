vim.api.nvim_set_keymap('n', '<A-,>', ':BufferPrevious<CR>', {})
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferNext<CR>', {})
vim.api.nvim_set_keymap('n', '<A-<>', ':BufferMovePrevious<CR>', {})
vim.api.nvim_set_keymap('n', '<A->>', ':BufferMoveNext<CR>', {})
vim.api.nvim_set_keymap('n', '<A-1>', ':BufferGoto 1<CR>', {})
vim.api.nvim_set_keymap('n', '<A-2>', ':BufferGoto 2<CR>', {})
vim.api.nvim_set_keymap('n', '<A-3>', ':BufferGoto 3<CR>', {})
vim.api.nvim_set_keymap('n', '<A-4>', ':BufferGoto 4<CR>', {})
vim.api.nvim_set_keymap('n', '<A-5>', ':BufferGoto 5<CR>', {})
vim.api.nvim_set_keymap('n', '<A-6>', ':BufferGoto 6<CR>', {})
vim.api.nvim_set_keymap('n', '<A-7>', ':BufferGoto 7<CR>', {})
vim.api.nvim_set_keymap('n', '<A-8>', ':BufferGoto 8<CR>', {})
vim.api.nvim_set_keymap('n', '<A-9>', ':BufferGoto 9<CR>', {})
vim.api.nvim_set_keymap('n', '<A-0>', ':BufferLast<CR>', {})
vim.api.nvim_set_keymap('n', '<A-c>', ':BufferClose<CR>', {})
vim.api.nvim_set_keymap('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', {})
vim.api.nvim_set_keymap('n', '<Space>bd', ':BufferOrderByDirectory<CR>', {})
vim.api.nvim_set_keymap('n', '<Space>bl', ':BufferOrderByLanguage<CR>', {})

