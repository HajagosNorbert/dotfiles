local colorscheme = "tokyonight-night"
--[[ local colorscheme = "gruvbox" ]]
--[[ local colorscheme = "duskfox" ]]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
