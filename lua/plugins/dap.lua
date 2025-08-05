return {
  {
    "mfussenegger/nvim-dap",
    config = require("configs.nvim-dap"),
    keys = require("keys.nvim-dap"), 
    dependencies = { "mason-org/mason.nvim", "igorlfs/nvim-dap-view", "theHamsta/nvim-dap-virtual-text", "stevearc/overseer.nvim" },
  },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   config = require("configs.nvim-dap-ui"),
  --   keys = require("keys.nvim-dap-ui"), 
  --   dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
  -- },
  {
      "igorlfs/nvim-dap-view",
      ---@module 'dap-view'
      ---@type dapview.Config
      opts = require("opts.nvim-dap-view"),
      keys = require("keys.nvim-dap-view")
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = require("opts.nvim-dap-virtual-text"),
    keys = require("keys.nvim-dap-virtual-text"),
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "leoluz/nvim-dap-go",
    config = true,
    keys = require("keys.nvim-dap-go"),
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    config = require("configs.nvim-dap-python"),    -- Consider the mappings at https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
    dependencies = { "mfussenegger/nvim-dap" },
  },
}
