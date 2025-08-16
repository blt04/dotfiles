return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "File Tree" },
  },
  config = function()
    require("nvim-tree").setup({})
  end,
}
