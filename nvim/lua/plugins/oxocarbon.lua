return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("oxocarbon")

      -- Transparência e ajustes básicos
      vim.opt.fillchars:append({ eob = " " })
      for _, g in ipairs({ "Normal", "NormalNC", "SignColumn", "MsgArea", "NormalFloat", "FloatBorder" }) do
        vim.api.nvim_set_hl(0, g, { bg = "NONE" })
      end
    end,
  },
}
