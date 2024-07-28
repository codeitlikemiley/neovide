return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      overrides = {
        ["@lsp.type.interface"] = { fg = "#b681ef" },
        ["@lsp.type.enum"] = { fg = "#F694C1" },
        ["@lsp.type.enumMember"] = { fg = "#00A5CF" },
        ["@lsp.type.variable"] = { fg = "#89D2DC" },
        ["@lsp.type.property"] = { fg = "#705D56" },
        ["@string"] = { fg = "#ebdbb2" },
        ["@lsp.type.method"] = { fg = "#F78154" },
        ["@lsp.type.function"] = { fg = "#F78154" },
        ["Comment"] = { fg = "#705D56", italic = true },
        --Comment       xxx cterm=italic gui=italic guifg=#928374
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
