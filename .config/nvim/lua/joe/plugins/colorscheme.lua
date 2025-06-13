-- bg color is #262626 (for nightfox terminal)
-- bg color is #121212 (for carbon terminal)
return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme carbonfox")
  end
}
