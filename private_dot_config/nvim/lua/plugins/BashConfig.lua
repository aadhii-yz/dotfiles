return {
  -- LSP for Shell Scripting
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = { -- LSP for Bash
          filetypes = { "sh", "bash", "zsh" },
          root_dir = require("lspconfig.util").find_git_ancestor,
        },
      },
    },
  },

  -- Install Mason packages for Shell
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server", -- LSP for shell scripts
        "shfmt", -- Code formatter for shell scripts
        "shellcheck", -- Linter for shell scripts
      },
    },
  },

  -- Syntax Highlighting with Tree-sitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "bash" }, -- Ensure Tree-sitter support for Bash
    },
  },

  -- ShellCheck Integration
  {
    "dense-analysis/ale",
    ft = { "sh", "bash", "zsh" },
    opts = {
      lint_on_save = true,
      lint_on_text_changed = "always",
      linters = { "shellcheck" },
    },
  },

  -- Enhance auto-completion
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "nvim_lsp" }, -- Add LSP-based completion
        { name = "buffer" }, -- Buffer-based completion
        { name = "path" }, -- Path-based completion
      }))
      return opts
    end,
  },
}
