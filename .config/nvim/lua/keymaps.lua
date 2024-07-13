-- Set leader key
vim.g.mapleader = ' '

-- mappings
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gl', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ':', ';', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = false })

-- current tab
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabe %<CR>', { noremap = true, silent = true })

-- nvim-tree toggle
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
-- TODO: あいまい検索されない
vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ':lua require(\'telescope.builtin\').buffers()<CR>', { noremap = true, silent = true })

-- vim quickrun
vim.api.nvim_set_keymap('n', '<Leader>r', ':QuickRun<CR>', { noremap = true, silent = true })
