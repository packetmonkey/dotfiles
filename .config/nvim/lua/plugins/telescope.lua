return {
  'nvim-telescope/telescope.nvim',

  branch = '0.1.x',

  dependencies = {
    'nvim-lua/plenary.nvim'
  },

  keys = {
    { "<leader>ff", require('telescope.builtin').find_files },
    { "<leader>fg", require('telescope.builtin').live_grep },
    { "<leader>fb", require('telescope.builtin').buffers },
  },
}
