local function config()
  local harpoon = require 'harpoon'
  vim.keymap.set('n', '<leader>a', function()
    harpoon:list():add()
  end, { desc = 'Add to harpoon list' })

  vim.keymap.set('n', '<C-e>', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set('n', '<C-S-P>', function()
    harpoon:list():prev()
  end)
  vim.keymap.set('n', '<C-S-N>', function()
    harpoon:list():next()
  end)

  local harpoon_extensions = require 'harpoon.extensions'
  harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
end

return config
