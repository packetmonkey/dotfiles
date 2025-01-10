return {
  "nvim-treesitter/nvim-treesitter",

  dependencies = {
    "RRethy/nvim-treesitter-endwise",
  },

  build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
  end,

  opts = {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
      "c", "lua", "vim", "vimdoc", "query", "yaml", "markdown",
      "markdown_inline", "ruby", "bash", "gitcommit", "sql", "gleam"
    },

    -- From RRethy/nvim-treesitter-endwise
    endwise = { enable = true },

    sync_install = false,   -- Install parsers asynchronously
    auto_install = true,    -- Install missing parsers when entering buffer

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
}
