return {
  -- Dashboard animado usando milli.nvim + snacks.nvim.
  -- Mantém o dashboard padrão do LazyVim/Snacks, mas troca o header pelo blackhole.
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
      "amansingh-afk/milli.nvim",
    },
    opts = function(_, opts)
      local splash_name = "blackhole"
      local ok, milli = pcall(require, "milli")
      local splash = ok and milli.load({ splash = splash_name }) or nil

      opts.dashboard = opts.dashboard or {}
      opts.dashboard.enabled = true
      opts.dashboard.preset = opts.dashboard.preset or {}

      -- O header precisa iniciar com o frame 1 para o milli encontrar a âncora e animar por cima.
      if splash and splash.frames and splash.frames[1] then
        opts.dashboard.preset.header = table.concat(splash.frames[1], "\n")
      else
        opts.dashboard.preset.header = table.concat({
          [[      /\_/\\      ]],
          [[     ( o.o )      ]],
          [[      > ^ <       ]],
          [[    V I B E C A T ]],
        }, "\n")
      end

      opts.dashboard.preset.keys = {
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        {
          icon = " ",
          key = "c",
          desc = "Config",
          action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
        },
        { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      }

      opts.dashboard.sections = {
        { section = "header", padding = 1 },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup", padding = 1 },
      }
    end,
    config = function(_, opts)
      require("snacks").setup(opts)
      require("milli").snacks({ splash = "blackhole", loop = true })
    end,
  },

  -- Garante que o alpha não roube a tela inicial.
  { "goolord/alpha-nvim", enabled = false },
}
