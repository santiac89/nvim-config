require "nvchad.autocmds"
local ft_lsp_group = vim.api.nvim_create_augroup("ft_lsp_group",{clear=true})
vim.api.nvim_create_autocmd({"BufReadPost","BufNewFile"},{
    pattern={"docker-compose.yaml","compose.yaml"},
    group = ft_lsp_group,
    desc = "Fix the issue where the LSP does not start with docker-compose.",
    callback = function ()
        vim.opt.filetype = "yaml.docker-compose"
    end
})

