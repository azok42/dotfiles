-- Open compiler
vim.api.nvim_set_keymap('n', '<leader>C', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap('n', '<leader>c',
     "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<leader>Ct', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
