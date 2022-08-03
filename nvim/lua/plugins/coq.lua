vim.g.coq_settings = {
    auto_start = 'shut-up'
}
require('lspconfig')['jedi_language_server'].setup(require('coq').lsp_ensure_capabilities({}))
require('lspconfig')['clangd'].setup(require('coq').lsp_ensure_capabilities({}))
require('lspconfig')['rust_analyzer'].setup(require('coq').lsp_ensure_capabilities({}))
