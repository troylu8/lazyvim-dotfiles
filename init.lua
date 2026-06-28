vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ".",
      [vim.diagnostic.severity.WARN]  = ".",
      [vim.diagnostic.severity.INFO]  = ".",
      [vim.diagnostic.severity.HINT]  = ".",
    },
  },
})

