return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<C-p>",
        "<cmd>lua Snacks.picker.files()<cr>",
        desc = "find file",
      },
    },
    opts = {
      indent = {
        enabled = false,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
            {
              "<C-.>",
              function()
                return vim.lsp.buf.hover()
              end,
              desc = "Hover",
            },
          },
        },
      },
    },
  },
}
