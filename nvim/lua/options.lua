--Indentation options
vim.opt.autoindent = true --inherited indentation
vim.opt.expandtab = true --tabs to spaces
vim.opt.shiftwidth = 4 --tabs are 4 spaces when shifting
vim.opt.smarttab = true --use tabstop for tabbing
vim.opt.tabstop = 4 --indent with 4 spaces

--Search options
vim.opt.ignorecase = true --ignore case
vim.opt.smartcase = true --unless there is a capital letter

--Performance options
vim.opt.ttyfast = true --also improves performance in vim

--Text rendering
vim.opt.encoding = 'utf-8' --use utf-8
vim.opt.wrap = true --enable line wrapping
vim.opt.linebreak = true --avoid wrapping a line in the middle of a word

--User interface
vim.opt.ruler = true --show cursor permission
vim.opt.number = true --line numbers
vim.opt.errorbells = false --disable beep on errors
vim.opt.title = true --window title to filename
vim.opt.background = 'dark' --use better colours for dark theme

--Backups
vim.opt.backup = false --no backups as I have git
vim.opt.wb = false --ignores it if it fails to write buffer
vim.opt.swapfile = false --remove swap files

--Other options
vim.opt.compatible = false --don't maintain vi compatibility
vim.opt.completeopt = {'menu', 'menuone', 'noselect'} --completion options
vim.opt.termguicolors = true --helps syntax highlighting
vim.opt.laststatus = 2 --status line stuff

