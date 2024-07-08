-- Set leader key
vim.g.mapleader = ' '

-- Key Mappings
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', 'gT', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ':', ';', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = false })

-- current tab
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabe %<CR>', { noremap = true, silent = true })

-- nvim-tree toggle
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>a', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>b', ':lua require(\'telescope.builtin\').buffers()<CR>', { noremap = true, silent = true })
