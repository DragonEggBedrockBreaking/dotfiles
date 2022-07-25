vim.g.coq_settings = {
    auto_start = 'shut-up'
}
require('lspconfig')['pylsp'].setup(require('coq').lsp_ensure_capabilities({}))
