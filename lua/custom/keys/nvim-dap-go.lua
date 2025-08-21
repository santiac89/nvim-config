return {
  {
    '<leader>ddt',
    function()
      require('dap-go').debug_test()
    end,
    desc = 'Debug test (Golang)',
  },
}
