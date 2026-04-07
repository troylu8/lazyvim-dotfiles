return {
    { "folke/tokyonight.nvim", enabled = false },
    {
        "noice.nvim",
        opts = {
            lsp = {
                hover = { silent = true },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
                progress = { enabled = false },
            },
            cmdline = { enabled = false },
            messages = { enabled = false },
            views = {
                hover = {
                    border = {
                        style = "rounded",
                    },
                    position = { row = 2 },
                },
            },
        },
    },
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
                        "--tab-width",
                        "4",
                        "--use-tabs",
                        "false",
                    },
                },
            },
        },
    },
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
            inlay_hints = { enabled = false },
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
                vtsls = {
                    experimental = {
                        completion = {
                            enableServerSideFuzzyMatch = false,
                        },
                    },
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
                numbers = "none",
                always_show_bufferline = true,
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "diagnostics" },
                lualine_x = { { "filename", path = 1 } },
                lualine_y = { "encoding", "filetype" },
                lualine_z = { "location" },
            },
        },
    },
    {
        "saghen/blink.cmp",
        opts = {
            keymap = { preset = "super-tab" },
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
                        ignored = true,
                        layout = {
                            layout = {
                                width = 32,
                            },
                        },
                    },
                },
                matcher = {
                    frecency_bonus = true,
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
    {
        "nvim-mini/mini.surround",
        optional = true,
        opts = {
            mappings = {
                add = "gza", -- Add surrounding in Normal and Visual modes
                delete = "gzd", -- Delete surrounding
                find = "gzf", -- Find surrounding (to the right)
                find_left = "gzF", -- Find surrounding (to the left)
                highlight = "gzh", -- Highlight surrounding
                replace = "gzr", -- Replace surrounding
                update_n_lines = "gzn", -- Update `n_lines`
            },
        },
        keys = {
            { "gz", "", desc = "+surround" },
        },
    },
}
