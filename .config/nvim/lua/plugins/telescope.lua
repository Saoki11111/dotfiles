return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-f>"] = require('telescope.builtin').find_files,
            ["<C-a>"] = function()
              require('telescope.builtin').live_grep({
                additional_args = function()
                  return {"--ignore-case"}
                end
              })
            end,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    },
    config = function()
      require('telescope').load_extension('fzf')
    end
  }
}
