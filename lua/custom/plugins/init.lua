-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        function()
          require('trouble').toggle { mode = 'diagnostics' }
        end,
        desc = 'Trouble',
      },
      {
        '[d',
        function()
          require('trouble').previous { skip_groups = true, jump = true, mode = 'diagnostics' }
        end,
        desc = 'Previous Diagnostic',
      },
      {
        ']d',
        function()
          require('trouble').next { skip_groups = true, jump = true, mode = 'diagnostics' }
        end,
        desc = 'Next Diagnostic',
      },
    },
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {}
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        opleader = {
          line = 'gc',
          block = 'gb',
        },

        mappings = {
          basic = true,
          extra = true,
          extended = true,
        },

        toggler = {
          line = 'gcc',
          block = 'gbc',
        },
      }

      local comment_ft = require 'Comment.ft'
      comment_ft.set('lua', { '--%s', '--[[%s]]' })
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
