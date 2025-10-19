return {
  'nvim-telescope/telescope.nvim',

  branch = 'master',

  dependencies = {
    'nvim-lua/plenary.nvim'
  },

  keys = {
    { "<leader>ff", require('telescope.builtin').find_files },
    { "<leader>fg", require('telescope.builtin').live_grep },
    { "<leader>fb", require('telescope.builtin').buffers },
  },
}
