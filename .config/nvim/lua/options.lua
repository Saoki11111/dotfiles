-- Options
vim.opt.expandtab = true      -- タブ入力を複数の空白入力に置き換える
vim.opt.tabstop = 2           -- 画面上でタブ文字が占める幅
vim.opt.softtabstop = 2       -- 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
vim.opt.autoindent = true     -- 改行時に前の行のインデントを継続する
vim.opt.shiftwidth = 2        -- smartindentで増減する幅

vim.o.scrolloff = 5

vim.opt.number = true         -- 行番号を表示する
vim.api.nvim_win_set_option(0, 'cursorline', true)
vim.opt.clipboard = "unnamedplus" -- clipboard
vim.opt.list = true
vim.opt.listchars = {
	tab = '│·',
	extends = '⟩',
	precedes = '⟨',
	trail = '·',
	eol = '↴',
	nbsp = '%',
}
