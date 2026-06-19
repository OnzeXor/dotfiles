return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    use_default_keymaps = true,
    keymaps = {
      ["L"] = "actions.select", -- entrar na pasta / abrir arquivo
      ["H"] = "actions.parent", -- subir um nível
      ["<CR>"] = "actions.select", -- mantém o Enter funcionando
      ["q"] = "actions.close", -- fecha o Oil bonitinho
      ["K"] = "actions.preview",
      ["gr"] = "actions.refresh",
      ["g."] = "actions.toggle_hidden",
    },
    float = {
      padding = 4,
      max_width = 90,
      max_height = 30,
      border = "rounded", -- single, double, shadow, rounded
      win_options = {
        winblend = 00, -- transparência
      },
    },
  },
  keys = {
    { "<leader>e", "<cmd>Oil --float<CR>", desc = "Abrir Oil bonitinho" },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
}
