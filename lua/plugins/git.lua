return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<leader>gb', function()
          gs.blame_line { full = true }
        end)
      end,
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gs', vim.cmd.Git, desc = '[G]it [S]tatus' },
      {
        '<leader>gp',
        function()
          vim.cmd.Git 'push'
        end,
        desc = '[G]it [P]ush',
      },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>gg', vim.cmd.LazyGit, { desc = 'LazyGit' })
      require('telescope').load_extension 'lazygit'
    end,
  },
}
