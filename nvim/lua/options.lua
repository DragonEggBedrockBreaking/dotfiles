vim.opt.autoindent = true --automatic indentation
vim.opt.expandtab = true --tabs to spaces
vim.opt.shiftwidth = 4 --tab = 4 spaces
vim.opt.smarttab = true --tabstop
vim.opt.tabstop = 4 --tab = 4 spaces
vim.opt.formatoptions -= co --comment on newline disabled for o in command (not enter in i)

vim.opt.ignorecase = true --ignore case in search
vim.opt.smartcase = true --unless there's a capital

vim.opt.encoding = 'utf-8' --utf-8 encoding
vim.opt.wrap = true --line wrapping
vim.opt.linebreak = true --avoid line wrap in middle of word

vim.opt.ruler = true --show cursor position
vim.opt.number = true --line number
vim.opt.errorbells = false --disable beep on error
vim.opt.title = true --window title = filename
vim.opt.background = 'dark' --better dark theme

vim.opt.backup = false --git
vim.opt.swapfile = false --remove swapfile

vim.opt.compatible = false --ignore vi compat
vim.completeopt = {'menu', 'menuone', 'noselect'} --helps autocomplete
vim.opt.termguicolors = true --helps syntax highlighting
vim.opt.laststatus = 2 --status line
vim.opt.ttyfast = true --improves performance
