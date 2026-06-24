return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = {
    { "<leader>e", "<cmd>Oil --float<CR>", desc = "Abrir Oil" },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    use_default_keymaps = true,
    keymaps = {
      ["L"] = "actions.select",
      ["H"] = "actions.parent",
      ["<CR>"] = "actions.select",
      ["q"] = "actions.close",
      ["K"] = "actions.preview",
      ["gr"] = "actions.refresh",
      ["g."] = "actions.toggle_hidden",
    },
    float = {
      padding = 4,
      max_width = 90,
      max_height = 30,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
  },
}
