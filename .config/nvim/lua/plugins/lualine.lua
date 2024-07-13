return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'dracula',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'encoding', 'fileformat'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      }
    }
  }
}
