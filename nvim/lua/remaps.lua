vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- fugitive keymaps
vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
vim.keymap.set("n", "<leader>gp", function () vim.cmd.Git("push") end )
vim.keymap.set("n", "<leader>gpl", function () vim.cmd.Git("pull") end )
vim.keymap.set("n", "<leader>gc", function () vim.cmd.Git("commit") end )
vim.keymap.set("n", "<leader>gm", function ()
   vim.ui.input( { prompt = "Message: ", scope = "buffer" }, function (input)
      vim.cmd.Git('commit -m "' .. input .. '"')
   end )
end)

-- gitsigns keymaps
local gitSignes = require('gitsigns');
vim.keymap.set("n", "<leader>gsb", function() gitSignes.stage_buffer() end)
vim.keymap.set("n", "<leader>gsh", function() gitSignes.stage_hunk() end)
vim.keymap.set("n", "<leader>gsp", function() gitSignes.preview_hunk() end)
vim.keymap.set("n", "<leader>gsn", function() gitSignes.nav_hunk("next") end)
vim.keymap.set("n", "<leader>gsN", function() gitSignes.nav_hunk("next") end)

-- undotree keymaps
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- harpoon quick selects
for i = 0, 9 do
   vim.keymap.set("n", "<A-" .. i .. ">", function() harpoon:list():select(i) end)
end

vim.keymap.set("n", "<C-S-H>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-L>", function() harpoon:list():next() end)

-- neogen
local neogen = require("neogen")
vim.keymap.set("n", "<leader>df", neogen.generate, { desc = "Generate Documentation" })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search  = vim.fn.input("Grep > ") });
end, { desc = 'Telescope find files' })

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set('n', 'E', vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)

-- compiler
vim.api.nvim_set_keymap('n', '<leader>C', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>c',
     "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>Ct', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
