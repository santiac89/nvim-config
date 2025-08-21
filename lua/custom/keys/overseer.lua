return {
  {
    '<leader>dt',
    function()
      require('overseer').toggle {}
    end,
    desc = 'Toggle Tasks',
  },
}
