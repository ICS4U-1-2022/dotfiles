require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"

require('feline').setup()
require("github-theme").setup({
    theme_style = "dark_colorblind",
    -- other config
  })