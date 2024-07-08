return {
  {
    'nvim-telescope/telescope.nvim',
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-f>"] = require('telescope.builtin').find_files,
            ["<C-a>"] = require('telescope.builtin').live_grep,
          },
        },
      }
    }
  }
}
