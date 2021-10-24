"Indentation options
set autoindent "inherited indentation
set expandtab "tabs to spaces
set shiftwidth=4 "tabs are 4 spaces when shifting
set smarttab "use tabstop for tabbing
set tabstop=4 "indent with 4 spaces

"Search options
set ignorecase "ignore case
set smartcase "unless there is a capital letter

"Performance options
set lazyredraw "don't update screen during macro and script execution

"Text rendering
set encoding=utf-8 "use utf-8
syntax enable "enable syntax highlighting
set wrap "enable line wrapping
set linebreak "avoid wrapping a line in the middle of a word

"User interface
set ruler "show cursor permission
set number "line numbers
set noerrorbells "disable beep on errors
set title "set window title to filename
set background=dark " use better colours for dark theme

"Backups
set nobackup "no backups as I have git
set nowb "ignores it if it fails to write buffer
set noswapfile "remove swap files

"Usability options
set nocompatible

"Plugins
call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-fugitive' "git inside vim
    Plug 'preservim/nerdtree' "file management inside vim
    Plug 'vim-syntastic/syntastic' "syntax checker inside vim
    Plug 'mfussenegger/nvim-dap' "debugger inside vim
    Plug 'neovim/nvim-lspconfig' "language server protocol in neovim
    Plug 'hrsh7th/cmp-nvim-lsp' "autocompletion
    Plug 'hrsh7th/cmp-buffer' "autocompletion
    Plug 'hrsh7th/nvim-cmp' "autocompletion
    Plug 'L3MON4D3/LuaSnip' "snippets
    Plug 'saadparwaiz1/cmp_luasnip' "snippets
    Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'} "better syntax highlighting
    Plug 'mfussenegger/nvim-dap' "debugger
    Plug 'mfussenegger/nvim-dap-python' "python debugger
    Plug 'ellisonleao/glow.nvim' "markdown previewer
    Plug 'mg979/vim-visual-multi' "multiple cursors
    Plug 'Yggdroot/indentLine' "visual indents
call plug#end()

"NERDTree hotkey
nnoremap <leader>fm :NERDTree<cr>

"Formatting code
nnoremap <leader>fmtc :!astyle -xnxcxlxkxVCxGSKNs4A1 %<cr>
nnoremap <leader>fmtjson :!fixjson --write --indent 4 %<cr>
nnoremap <leader>fmtpy :!autopep8 --aggressive --experimental --in-place --max-line-length 100 %<cr>
nnoremap <leader>fmtrs :!rustfmt --unstable-features --emit files %<cr>
nnoremap <leader>fmtsh :!shfmt -w -s -i 4 %<cr>

"Running code
nnoremap <leader>bdc :!gcc % -o %:r.out<cr>
nnoremap <leader>bdcpp :!g++ % -o %:r.out<cr>
nnoremap <leader>bdcg :!cargo build<cr>
nnoremap <leader>bdrs :!rustc %<cr>
nnoremap <leader>rnc :!gcc % -o %:r.out && ./%:r.out<cr>
nnoremap <leader>rncpp :!g++ % -o %:r.out && ./%:r.out<cr>
nnoremap <leader>rncg :!cargo run<cr>
nnoremap <leader>rnpy :!python %<cr>
nnoremap <leader>rnrs :!rustc % && ./%:r<cr>

"Dealing with syntastic
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_lua_checkers = ['luacheck']
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_python_checkers = ['pylint']

"Dealing with autocompletion
set completeopt=menu,menuone,noselect "completion options

"All lua stuff
lua <<EOF
    -- Setup nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        }, {
            { name = 'buffer' },
        })
    })

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    require('lspconfig')['clangd'].setup {
        capabilities = capabilities
    }
    require('lspconfig')['pylsp'].setup {
        capabilities = capabilities
    }
    require('lspconfig')['rust_analyzer'].setup {
        capabilities = capabilities
    }


    -- Treesitter config
    require'nvim-treesitter.configs'.setup {
        highlight = {
            enable = true,
        }
    }


    -- Setup nvim-dap
    require('dap-python').setup('/usr/bin/python')
EOF

"Setup nvim-dap
nnoremap <silent> <leader>c :lua require('dap').continue()<CR>
nnoremap <silent> <leader>n :lua require'dap'.step_over()<CR>
nnoremap <silent> <leader>. :lua require'dap'.step_into()<CR>
nnoremap <silent> <leader>, :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>o :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>v :lua require'dap'.repl.run_last()<CR>`
nnoremap <silent> <leader>t :lua require('dap-python').test_method()<CR>
vnoremap <silent> <leader>d <ESC>:lua require('dap-python').debug_selection()<CR>
