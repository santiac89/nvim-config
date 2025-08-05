return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require("opts.conform"),
    keys = require("keys.conform")  
  },
  {
    "neovim/nvim-lspconfig",
    config = require("configs.nvim-lspconfig")
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  }
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
