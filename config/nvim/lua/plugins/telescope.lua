return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  keys = {
    { "<leader>t", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        -- Optional: Configure the ui-select theme
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(), -- Example: use the dropdown theme
        },
      },
    }
    -- Load the ui-select extension
    require('telescope').load_extension 'ui-select'
  end,
}
