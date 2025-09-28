return {
	-- Install LSPs via Mason
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"html-lsp",
				"css-lsp",
				"typescript-language-server",
			})
		end,
	},

	-- Enable the LSPs
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				html = {},
				cssls = {},
				tsserver = {},
			},
		},
	},

	-- Treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"html",
				"css",
				"javascript",
				"typescript",
			})
		end,
	},
}
