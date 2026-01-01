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
      dashboard = {
        width = 30,
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "find file", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "g", desc = "grep", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "recent files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "s", desc = "restore session", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "quit", action = ":qa" },
          },
        },
        sections = {
          {
            section = "keys",
            gap = 1,
            padding = 1,
          },
        },
      },
    },
  },
}
