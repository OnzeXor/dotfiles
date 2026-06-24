return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Janela esquerda" },
    { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Janela baixo" },
    { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Janela cima" },
    { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Janela direita" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", desc = "Janela anterior" },
  },
}
