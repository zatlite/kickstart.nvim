-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
  },
  {
    'nvimtools/none-ls.nvim',
    event = { 'bufreadpre', 'bufnewfile' },
    dependencies = { 'mason.nvim', 'davidmh/cspell.nvim' },
    opts = function()
      local cspell = require 'cspell'
      return {
        sources = {
          cspell.diagnostics,
          cspell.code_actions,
        },
      }
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    keys = {
      { '<leader>mp', '<CMD>MarkdownPreviewToggle<CR>', desc = '[M]arkdown [P]review' },
    },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'ThePrimeagen/harpoon',
    config = function()
      vim.keymap.set('n', '<leader>a', require('harpoon.mark').add_file, { desc = 'Harpoon add file' })
      vim.keymap.set('n', '<C-e>', require('harpoon.ui').toggle_quick_menu, { desc = 'Harpoon toggle menu' })
      for i = 1, 9 do
        vim.keymap.set('n', '<leader>' .. i, function()
          require('harpoon.ui').nav_file(i)
        end, { desc = 'Harpoon switch to file ' .. i })
      end
    end,
  },
  {
    'alexghergh/nvim-tmux-navigation',
    keys = {
      {
        '<C-h>',
        function()
          require('nvim-tmux-navigation').NvimTmuxNavigateLeft()
        end,
        desc = 'vim tmux nav left',
      },
      {
        '<C-j>',
        function()
          require('nvim-tmux-navigation').NvimTmuxNavigateDown()
        end,
        desc = 'vim tmux nav down',
      },
      {
        '<C-k>',
        function()
          require('nvim-tmux-navigation').NvimTmuxNavigateUp()
        end,
        desc = 'vim tmux nav up',
      },
      {
        '<C-l>',
        function()
          require('nvim-tmux-navigation').NvimTmuxNavigateRight()
        end,
        desc = 'vim tmux nav right',
      },
      {
        '<C-\\>',
        function()
          require('nvim-tmux-navigation').NvimTmuxNavigateLastActive()
        end,
        desc = 'vim tmux nav previous',
      },
    },
  },
}
