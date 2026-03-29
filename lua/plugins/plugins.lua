return {
    { "folke/tokyonight.nvim", enabled = false },
    { "noice.nvim", enabled = false },
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
            format = {
                auto = false,
            },
            colorscheme = "catppuccin-mocha",
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                c = { "clang-format" },
                cpp = { "clang-format" },
                typescriptreact = { "prettier" },
            },
            formatters = {
                ["clang-format"] = {
                    prepend_args = {
                        "--style={IndentWidth: 4, TabWidth: 4, UseTab: Never, ColumnLimit: 0}",
                    },
                },
                ["prettier"] = {
                    prepend_args = {
                        "--tab-width", "4",
                        "--use-tabs", "false",
                    },
                },
            },
        },
    },
    -- {
    --     "axkirillov/hbac.nvim",
    --     config = true,
    --     opts = {
    --         threshold = 0,
    --     },
    -- },
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
            indent = { enabled = false },
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
                clangd = {
                    cmd = { "clangd", "--header-insertion=never" },
                },
            },
        },
    },
    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                tab_size = 14,
                enforce_regular_tabs = false,
                numbers = "ordinal",
                always_show_bufferline = true,
            },
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
            picker = {
                sources = {
                    explorer = {
                        hidden = true,
                        layout = {
                            layout = {
                                width = 32,
                            },
                        },
                    },
                },
            },
            dashboard = {
                width = 30,
                preset = {
                    keys = {
                        {
                            icon = " ",
                            key = "f",
                            desc = "find file",
                            action = ":lua Snacks.dashboard.pick('files')",
                        },
                        { icon = " ", key = "g", desc = "grep", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "s", desc = "restore session", section = "session" },
                        {
                            icon = " ",
                            key = "c",
                            desc = "config",
                            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                        },
                        {
                            icon = "󰒲 ",
                            key = "l",
                            desc = "Lazy",
                            action = ":Lazy",
                            enabled = package.loaded.lazy ~= nil,
                        },
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
    { "dstein64/nvim-scrollview" },
    {
        "pocco81/auto-save.nvim",
        opts = {
            execution_message = { message = "" },
        },
    },
}
