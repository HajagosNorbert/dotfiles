local formatters = require("shared").formatters

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			-- Use a sub-list to run only the first available formatter
			["javascript"] = { { formatters.prettierd, formatters.prettier } },
			["lua"] = { formatters.stylua },
			["javascriptreact"] = { { formatters.prettierd, formatters.prettier } },
			["typescript"] = { { formatters.prettierd, formatters.prettier } },
			["typescriptreact"] = { { formatters.prettierd, formatters.prettier } },
			["vue"] = { { formatters.prettierd, formatters.prettier } },
			["css"] = { { formatters.prettierd, formatters.prettier } },
			["scss"] = { { formatters.prettierd, formatters.prettier } },
			["less"] = { { formatters.prettierd, formatters.prettier } },
			["html"] = { { formatters.prettierd, formatters.prettier } },
			["json"] = { { formatters.prettierd, formatters.prettier } },
			["jsonc"] = { { formatters.prettierd, formatters.prettier } },
			["yaml"] = { { formatters.prettierd, formatters.prettier } },
			["markdown"] = { { formatters.prettierd, formatters.prettier } },
			["markdown.mdx"] = { { formatters.prettierd, formatters.prettier } },
			["graphql"] = { { formatters.prettierd, formatters.prettier } },
			["handlebars"] = { { formatters.prettierd, formatters.prettier } },
			["nix"] = { formatters["nixpkgs-fmt"] },
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
