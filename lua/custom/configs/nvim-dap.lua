local function config()
  local dap = require 'dap'
  local sign = vim.fn.sign_define
  local set_hl = vim.api.nvim_set_hl

  set_hl(0, 'RedCursor', { fg = '#ff0000', bg = None })
  set_hl(0, 'YellowCursor', { fg = '#FFCC00', bg = None })
  set_hl(0, 'YellowBack', { bg = '#4C4C19' })

  sign('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
  sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })
  sign('DapBreakpoint', { text = '●', texthl = 'RedCursor', linehl = '', numhl = '' })
  sign('DapStopped', { text = '', texthl = 'YellowCursor', linehl = 'YellowBack', numhl = '' })

  dap.adapters.cppdbg = {
    id = 'cppdbg',
    command = vim.fn.exepath 'OpenDebugAD7',
    type = 'executable',
  }

  dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
      command = vim.fn.exepath 'codelldb',
      args = { '--port', '${port}' },
    },
  }

  dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
      command = vim.fn.exepath 'dlv',
      args = { 'dap', '-l', '127.0.0.1:${port}' },
    },
  }

  dap.adapters.go = {
    type = 'server',
    host = '127.0.0.1',
    port = 2345,
  }

  dap.configurations.go = {
    {
      type = 'go',
      name = 'Delve: Attach',
      request = 'attach',
      outputMode = 'remote',
      mode = 'remote',
      substitutePath = {
        {
          from = '${workspaceFolder}',
          to = '/app',
        },
      },
    },
    {
      type = 'delve',
      name = 'Delve: Debug',
      request = 'launch',
      outputMode = 'remote',
      program = function()
        local mainfile = vim.fn.getcwd() .. '/main.go'
        return '.'
        --        if vim.fn.empty(vim.fn.glob(mainfile)) == 0 then
        --        return mainfile
        --    end
        --        return vim.fn.input('Path to main file: ', vim.fn.getcwd() .. '/', 'file')
      end,
    },
    {
      type = 'delve',
      name = 'Delve: Debug (Arguments)',
      request = 'launch',
      outputMode = 'remote',
      program = function()
        --        local mainfile = vim.fn.getcwd() .. '/main.go'
        --      if vim.fn.empty(vim.fn.glob(mainfile)) == 0 then
        --      return mainfile
        --  end

        --return vim.fn.input('Path to main file: ', vim.fn.getcwd() .. '/', 'file')
        return '.'
      end,
      args = function()
        return vim.split(vim.fn.input 'Args: ', ' ')
      end,
    },
    {
      type = 'delve',
      name = 'Delve: Debug test', -- configuration for debugging test files
      request = 'launch',
      mode = 'test',
      program = '${file}',
      outputMode = 'remote',
    },
    -- works with go.mod packages and sub packages
    {
      type = 'delve',
      name = 'Delve: Debug test (go.mod)',
      request = 'launch',
      mode = 'test',
      program = './${relativeFileDirname}',
      outputMode = 'remote',
    },
  }

  dap.configurations.cpp = {
    {
      name = 'Launch file (args)',
      type = 'codelldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      args = function()
        return vim.split(vim.fn.input 'Args: ', ' +', { trimempty = true })
      end,
      stopAtEntry = true,
    },
  }
end

return config
