-- Debugging
return {
  'nvim-lua/plenary.nvim',
  {
    'mfussenegger/nvim-dap',
    --[[
    config = function ()
      local dap = require('dap')
      dap.configurations.python = {
        {
          type = 'python';
          request = 'launch';
          name = "Launch file";
          program = "${file}";
          pythonPath = function()
            return '/usr/bin/python'
          end,
        }
      }
    end,
    --]]
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function ()
      require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
      require('dap-python').test_runner = 'pytest'
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      'mfussenegger/nvim-dap',
      'folke/neodev.nvim', -- apparently strongly recommended
    },
  },
}


