--Keymapping function
local map = vim.api.nvim_set_keymap

-- formatting code
map('n', 'fjson', ':!fixjson -wi4 %<CR>', {noremap = true}) -- Json
map('n', 'fpy', ':!autopep8 -ai --experimental  --max-line-length 100 %<CR>', {noremap = true}) -- Python
map('n', 'fsh', ':!shfmt -w -s -i 4 %<CR>', {noremap = true}) -- Shell

-- running code
map('n', 'rpy', ':!python3 %<CR>', {noremap = true}) -- Python (normal interpreter)
map('n', 'rpp', ':!pypy3 %<CR>', {noremap = true}) -- Python (pypy)

-- nvim-dap (debugging)
map('n', '<leader>c', ':lua require("dap").continue()<CR>', {noremap = true})
map('n', '<leader>n', ':lua require("dap").step_over()<CR>', {noremap = true})
map('n', '<leader>.', ':lua require("dap").step_into()<CR>', {noremap = true})
map('n', '<leader>,', ':lua require("dap").step_out()<CR>', {noremap = true})
map('n', '<leader>b', ':lua require("dap").toggle_breakpoint()<CR>', {noremap = true})
map('n', '<leader>o', ':lua require("dap").repl.open()<CR>', {noremap = true})
map('n', '<leader>v', ':lua require("dap").repl.run_last()<CR>', {noremap = true})

-- telescope (fuzzy finder)
map('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<cr>', {noremap = true})
map('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<cr>', {noremap = true})
map('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<cr>', {noremap = true})
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<cr>', {noremap = true})

-- barbar (top bar)
map('n', '<A-,>', ':BufferPrevious<CR>', { noremap = true })
map('n', '<A-.>', ':BufferNext<CR>', { noremap = true })
map('n', '<A-<>', ':BufferMovePrevious<CR>', { noremap = true })
map('n', '<A->>', ' :BufferMoveNext<CR>', { noremap = true })
map('n', '<A-1>', ':BufferGoto 1<CR>', { noremap = true })
map('n', '<A-2>', ':BufferGoto 2<CR>', { noremap = true })
map('n', '<A-3>', ':BufferGoto 3<CR>', { noremap = true })
map('n', '<A-4>', ':BufferGoto 4<CR>', { noremap = true })
map('n', '<A-5>', ':BufferGoto 5<CR>', { noremap = true })
map('n', '<A-6>', ':BufferGoto 6<CR>', { noremap = true })
map('n', '<A-7>', ':BufferGoto 7<CR>', { noremap = true })
map('n', '<A-8>', ':BufferGoto 8<CR>', { noremap = true })
map('n', '<A-9>', ':BufferGoto 9<CR>', { noremap = true })
map('n', '<A-0>', ':BufferLast<CR>', { noremap = true })
map('n', '<A-c>', ':BufferClose<CR>', { noremap = true })
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', { noremap = true })
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', { noremap = true })
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', { noremap = true })

