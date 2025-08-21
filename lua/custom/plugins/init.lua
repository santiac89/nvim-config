-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
    keys = require 'custom.keys.overseer',
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = require 'custom.configs.harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'numToStr/Comment.nvim',
    config = true,
    opts = {
      -- add any options here
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        -- Automatically moevs the focus in nvim-tree to the current file
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      }
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = '[E]xplorer Toggle' })

      -- Opens nvim-tree automatically with new tabs
      vim.api.nvim_create_autocmd('TabNewEntered', {
        callback = function()
          require('nvim-tree.api').tree.open()
        end,
      })

      -- Closes nvim-tree automatically if it's the only thing left in the buffer
      vim.o.confirm = true
      vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup('NvimTreeClose', { clear = true }),
        callback = function()
          local layout = vim.api.nvim_call_function('winlayout', {})
          if layout[1] == 'leaf' and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), 'filetype') == 'NvimTree' and layout[3] == nil then
            vim.cmd 'quit'
          end
        end,
      })
    end,
  },
}
