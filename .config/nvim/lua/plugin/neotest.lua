--TODO: None of this is working... Great!

local util = require("lspconfig.util")
local function get_playwright_conf_dir(root_dir)
	local function check_dir(path)
		local conf_file = path .. "/playwright.config.ts"
		print(conf_file)
		if util.path.exists(conf_file) then
			return path
		end
	end

	local current_file = vim.api.nvim_buf_get_name(0) -- Get the full path of the currently opened file
	local current_dir = vim.fn.fnamemodify(current_file, ":h") -- Get the directory of the currently opened file
	local found = util.search_ancestors(current_dir, check_dir)
	if found then
		return found
	else
		return nil
	end
end

-- local function find_playwright_conf_dif()
-- 	local current_file = vim.api.nvim_buf_get_name(0) -- Get the full path of the currently opened file
-- 	local current_dir = vim.fn.fnamemodify(current_file, ":h") -- Get the directory of the currently opened file
--
-- 	-- Loop until we reach the root directory or the current working directory
-- 	while current_dir ~= "/" and current_dir ~= vim.fn.getcwd() do
-- 		local package_json = current_dir .. "playwright.config.ts"
-- 		if vim.fn.filereadable(package_json) == 1 then
-- 			print(current_dir)
-- 			return current_dir -- Found package.json in the current directory
-- 		else
-- 			-- Move up one directory
-- 			current_dir = vim.fn.fnamemodify(current_dir, ":h")
-- 		end
-- 	end
--
-- 	return nil
-- end

local function get_playwright_bin()
	local a = get_playwright_conf_dir() .. "/node_modules/.bin/playwright"
	print(a)
	return a
end
local function get_playwright_conf()
	local a = get_playwright_conf_dir() .. "/playwright.config.ts"
	print(a)
	return a
end

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- They recommend it, but the fixcursor repo owner stated that it is no longer needed
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"thenbe/neotest-playwright",
		-- only for the util function
		"neovim/nvim-lspconfig",
	},
	lazy = false,
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-playwright").adapter({
					options = {
						persist_project_selection = true,
						enable_dynamic_test_discovery = true,
						get_playwright_config = get_playwright_conf,
						get_playwright_binary = get_playwright_bin,
					},
				}),
			},
			output = { open_on_run = true },
			status = { virtual_text = true },
		})
	end,
	-- stylua: ignore
	keys = {
		{ "<leader>tp", get_playwright_conf, desc = "find package json" },
		{ "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
		{ "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
		{ "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
		{ "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
		{ "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
		{ "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
		{ "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
		{ "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
	},
}
