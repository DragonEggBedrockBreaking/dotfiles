local lsp = require('lsp-zero').preset('recommended')
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "clangd", "eslint", "jdtls", "gopls", "nim_langserver", "pyright", "rust_analyzer", "svelte", "texlab", "tsserver", "zls" },
    skip_server_setup = { "rust_analyzer", "clangd" }
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lspconfig = require('lspconfig')
lspconfig.clangd.setup {}
lspconfig.eslint.setup {}
lspconfig.jdtls.setup {}
lspconfig.nim_langserver.setup {}
lspconfig.pyright.setup {}
lspconfig.svelte.setup {}
lspconfig.texlab.setup {}
lspconfig.zls.setup {}

require('copilot').setup({
    suggestion = {enabled = true},
    panel = {enabled = false}
})
require('copilot_cmp').setup()

local cmp = require('cmp')
cmp.setup({
    sources = {
        {name = 'copilot'},
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'luasnip'},
        {name = 'path'}
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    })
})

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

require('ufo').setup()

local ih = require('inlay-hints')
ih.setup()

lspconfig.gopls.setup({
  on_attach = function(c, b)
    ih.on_attach(c, b)
  end,
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

lspconfig.tsserver.setup({
  on_attach = function(c, b)
    ih.on_attach(c, b)
  end,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
})

local rust_tools = require('rust-tools')
rust_tools.setup({
    tools = {
        on_initialized = function()
            ih.set_all()
        end,
        inlay_hints = {
            auto = false,
        },
    },
    server = {
        on_attach = function(client, bufnr)
            vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, {buffer = bufnr})
            ih.on_attach(client, bufnr)
        end 
    }
})

require('clangd_extensions').setup()

lsp.setup()
