local parsers = { "c", "java", "c_sharp", "cpp", "lua", "json", "xml", "html", "css", "markdown", "vim", "vimdoc", "query" }

require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd("FileType", {
   group = vim.api.nvim_create_augroup("TreesitterAutoInstall", { clear = true }),
   callback = function(args)
      local ft = vim.bo[args.buf].filetype

      local has_parser, _ = pcall(vim.treesitter.query.get, ft, "highlights")
      if not has_parser then
         pcall(require('nvim-treesitter').install, ft)
      end

      pcall(vim.treesitter.start, args.buf)
   end,
})
