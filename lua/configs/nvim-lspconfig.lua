local function config()
  require("nvchad.configs.lspconfig").defaults()
  vim.lsp.enable({ "clangd", "gopls", "luals", "docker_compose_language_service", "dockerls" })
  
  vim.lsp.config("gopls", {
    settings = {
    gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        }
      }
    }
  })

end

return config
-- read :h vim.lsp.config for changing options of lsp servers 
