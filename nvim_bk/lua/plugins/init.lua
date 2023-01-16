return {
  "folke/neodev.nvim",
  { "folke/which-key.nvim", lazy = true },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { "numToStr/Comment.nvim", lazy = true },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = { char = "┊", show_trailing_blankline_indent = false },
    lazy = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        themes = "tokyonight",
        icons_enabled = false,
        component_separators = "|",
        section_separators = "",
      },
    },
  },
  {},
}
