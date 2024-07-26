
return {
  'mfussenegger/nvim-lint',
  cmd = { "BufWritePost" },
  config = function ()
    require('lint').linters_by_ft = {
      markdown = {'vale',},
      python= {'ruff',}
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end
}
