
-- Options

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4

vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.keymap.set("n", "o", 'o<Esc>0"_D', { noremap = true })
vim.keymap.set("n", "O", 'O<Esc>0"_D', { noremap = true })

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.diagnostic.config({
    virtual_lines = true,
})

-- Extensions

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then

  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- Extensions
    {
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },

    -- Extensions
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "markdown",
                    "markdown_inline",

                    "python",
                    "javascript",
                    "typescript",
                    "vue",
                    "bash",
                    "css",
                    "html",
                    "sql",
                    "json"
                },

                auto_install = true,

                highlight = {
                    enable = true,
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    },
                },

                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                        },
                        selection_modes = {
                            ['@parameter.outer'] = 'v',
                            ['@function.outer'] = 'V',
                            ['@class.outer'] = '<c-v>',
                        },
                        include_surrounding_whitespace = true,
                    },
                },

            })

        end,
    },

    -- Extensions
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    -- Extensions
    {
        "https://github.com/mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Extensions
    {
        "https://github.com/mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end,
    },

    -- Extensions
    {
        "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {"lua_ls", "ts_ls", "pyright", "eslint_d"}
            })

        end,
    },

    -- Extensions
    {
        "neovim/nvim-lspconfig",
    },

    -- Extensions
    {
        "https://github.com/saghen/blink.cmp",
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = {
            keymap = { preset = 'default' },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = { documentation = { auto_show = true } },
            sources = {
                default = { "lazydev", 'lsp', 'path', 'snippets', 'buffer' },
                  providers = {
                      lazydev = {
                          name = "LazyDev",
                          module = "lazydev.integrations.blink",
                          score_offset = 100,
                      },
                  },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },


    -- Extensions
    {
        "https://github.com/folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
     },
})
