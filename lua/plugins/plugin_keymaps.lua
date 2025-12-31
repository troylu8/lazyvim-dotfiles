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
  }
}
