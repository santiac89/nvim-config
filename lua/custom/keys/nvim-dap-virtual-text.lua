return {
  {
    '<leader>dv',
    function()
      require('nvim-dap-virtual-text').toggle()
    end,
    desc = 'Debug: Toggle Virtual Text',
  },
}
