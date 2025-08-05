return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = require("opts.lazydev")  
  },
  { -- optional cmp completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = require("opts.nvim-cmp")  
  },
  -- { -- optional blink completion source for require statements and module annotations
  --   "saghen/blink.cmp",
  --   opts = require("opts.blink-cmp")
  -- }
  -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
}
