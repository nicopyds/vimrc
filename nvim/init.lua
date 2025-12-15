
-- Options

-- options from .vimrc
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.foldmethod = "indent"
vim.opt.laststatus = 2
vim.opt.statusline:append("%F")
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.cmd([[
  highlight CursorLine cterm=bold ctermbg=black
]])

vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.swapfile = false

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

-- nvim config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

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
    current_line = false,
    virtual_lines = false,
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
            --keymap = { preset = 'default' },
            keymap = { preset = 'super-tab' },
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
