return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {
      custom_highlights = function(colors)
        return {
          CursorLineNr = { fg = colors.mauve, style = { "bold" } },
          LineNrAbove = { fg = colors.lavender },
          LineNrBelow = { fg = colors.lavender },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = { "branch" },
        lualine_x = { "diagnostics" },
        lualine_y = { "encoding", "filetype" },
        lualine_z = { "progress" },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        numbers = "ordinal",
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
}
