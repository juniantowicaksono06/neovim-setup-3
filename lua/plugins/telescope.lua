return {
  require("lazy").setup({
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
      config = function()
        require("telescope").setup({})
      end,
    },
  }),
}
