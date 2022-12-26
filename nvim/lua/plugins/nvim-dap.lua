require('dap-python').setup('/usr/bin/python3')

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
}
dap.configurations.c = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        --cwd = '${workspaceFolder}'.
        stopOnEntry = false,
        args = {},
        runInTerminal = true
    }
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
