return {
  colorscheme = "onedark",
  plugins = {
    {
      "navarasu/onedark.nvim",
      name = "onedark",
      config = function()
        require("onedark").setup {
          transparent = true,
        }
      end,
    },
  },
  options = {
    g = {
      icons_enabled = false,
    },
  },
}

