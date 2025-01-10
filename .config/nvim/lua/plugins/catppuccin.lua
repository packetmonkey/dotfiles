return {
  "catppuccin/nvim",

  lazy = false,
  name = "catppuccin",
  priority = 1000,

  config = function(_, _)
    vim.cmd("colorscheme catppuccin-mocha")
  end,
}
