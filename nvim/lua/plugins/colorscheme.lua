-- Centralize todos os temas e cores aqui.
-- Troque apenas este valor para mudar o tema principal.
local colorscheme = "nord"
local transparent_background = true

local terminal_palettes = {
  nord = {
    "#3b4252", -- black
    "#bf616a", -- red
    "#a3be8c", -- green
    "#ebcb8b", -- yellow
    "#81a1c1", -- blue
    "#b48ead", -- magenta
    "#88c0d0", -- cyan
    "#e5e9f0", -- white
    "#4c566a", -- bright black
    "#bf616a", -- bright red
    "#a3be8c", -- bright green
    "#ebcb8b", -- bright yellow
    "#81a1c1", -- bright blue
    "#b48ead", -- bright magenta
    "#8fbcbb", -- bright cyan
    "#eceff4", -- bright white
  },
  gruvbox = {
    "#282828",
    "#cc241d",
    "#98971a",
    "#d79921",
    "#458588",
    "#b16286",
    "#689d6a",
    "#a89984",
    "#928374",
    "#fb4934",
    "#b8bb26",
    "#fabd2f",
    "#83a598",
    "#d3869b",
    "#8ec07c",
    "#ebdbb2",
  },
  tokyonight = {
    "#15161e",
    "#f7768e",
    "#9ece6a",
    "#e0af68",
    "#7aa2f7",
    "#bb9af7",
    "#7dcfff",
    "#a9b1d6",
    "#414868",
    "#f7768e",
    "#9ece6a",
    "#e0af68",
    "#7aa2f7",
    "#bb9af7",
    "#7dcfff",
    "#c0caf5",
  },
  catppuccin = {
    "#45475a",
    "#f38ba8",
    "#a6e3a1",
    "#f9e2af",
    "#89b4fa",
    "#cba6f7",
    "#94e2d5",
    "#bac2de",
    "#585b70",
    "#f38ba8",
    "#a6e3a1",
    "#f9e2af",
    "#89b4fa",
    "#cba6f7",
    "#94e2d5",
    "#a6adc8",
  },
}

local function apply_terminal_colors(name)
  local palette = terminal_palettes[name] or terminal_palettes.nord
  for i, color in ipairs(palette) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

local function apply_transparency()
  if not transparent_background then
    return
  end

  local groups = {
    "Normal",
    "NormalNC",
    "SignColumn",
    "MsgArea",
    "NormalFloat",
    "FloatBorder",
    "WinSeparator",
    "EndOfBuffer",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end

local function apply_colorscheme()
  vim.opt.termguicolors = true
  vim.o.background = "dark"

  apply_terminal_colors(colorscheme)

  local ok, err = pcall(vim.cmd.colorscheme, colorscheme)
  if not ok then
    vim.notify("Colorscheme '" .. colorscheme .. "' falhou: " .. err, vim.log.levels.ERROR)
    pcall(vim.cmd.colorscheme, "tokyonight")
  end

  apply_transparency()

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("UserCentralizedColorscheme", { clear = true }),
    callback = function()
      apply_terminal_colors(colorscheme)
      vim.schedule(apply_transparency)
    end,
  })
end

return {
  -- Garante que o LazyVim também use o mesmo tema centralizado acima.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme,
    },
  },

  -- Tema atual: Nord. Antes estava chamando :colorscheme nord sem plugin instalado.
  {
    "shaunsingh/nord.nvim",
    name = "nord.nvim",
    lazy = false,
    priority = 1000,
    config = apply_colorscheme,
  },

  -- Outros temas ficam instalados/centralizados aqui para troca rápida.
  { "folke/tokyonight.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },

  -- Mantido disponível, mas não ativo como tema principal.
  { "szymonwilczek/arete.nvim", lazy = true },
}
