return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "python", "javascript", "html", "css", "bash", "c" }, -- Add your required languages
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
