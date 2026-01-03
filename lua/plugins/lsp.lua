return {
  {
    "LazyVim/LazyVim",
    opts = {
      format = {
        auto = false,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = {
            "-style={IndentWidth: 4, TabWidth: 4, UseTab: Never}"
          }
        },
      },
    },
  },
}
