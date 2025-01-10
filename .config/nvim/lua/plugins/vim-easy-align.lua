return {
  "junegunn/vim-easy-align",

  init = function(_)
    vim.g.easy_align_delimiters = {
      d = {
        pattern = "-"
      }
    }
  end,

  keys = {
    { "ga", "<Plug>(EasyAlign)", mode = { "n", "v" } }
  }
}
