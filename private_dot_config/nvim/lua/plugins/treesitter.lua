-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "LazyFile", "VeryLazy" }, -- "VeryLazy" may cause long startup time
  opts = {
    ensure_installed = {
      "c",
      "cpp",
      "lua",
      "bash",
      "diff",
      "go",
      "gomod",
      "gowork",
      "gosum",
    },
    highlight = { enable = true }, -- Enable syntax highlighting
    indent = { enable = true }, -- Enable automatic indentation
  },
}

-- old config :
-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     event = { "BufReadPost", "BufNewFile" },
--     config = function()
--       require("nvim-treesitter.configs").setup({
--         ensure_installed = { "c", "cpp" }, -- Ensure C/C++ support
--         highlight = { enable = true }, -- Enable syntax highlighting
--         indent = { enable = true }, -- Enable automatic indentation
--       })
--     end,
--   },
-- }
