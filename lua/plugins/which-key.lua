return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    
    -- Add key descriptions using the new v3 API
    wk.add({
      { "<leader>f", group = "find" },
      { "<leader>ff", desc = "Find files" },
      { "<leader>fw", desc = "Find word (grep)" },
      { "<leader>fc", desc = "Find config files" },
      { "<leader>fh", desc = "Find help" },
      
      { "<leader>g", desc = "Git status (Fugitive)" },
      { "<leader>gc", desc = "Git branches" },
      
      { "<leader>m", desc = "Alpha dashboard" },
      { "<leader>md", desc = "Markdown preview" },
      { "<leader>mp", desc = "Prettier format" },
      
      { "<leader>a", desc = "Select all text" },
      { "<leader>e", desc = "File explorer (Oil)" },
      { "<leader>t", desc = "New tab" },
      { "<leader>x", desc = "Close tab" },
      { "<leader>j", desc = "Previous tab" },
      { "<leader>k", desc = "Next tab" },
      { "<leader>q", desc = "Close buffer" },
      { "<leader>v", desc = "Vertical split" },
      { "<leader>s", desc = "Horizontal split" },
      
      { "<Tab>", desc = "Next buffer" },
      { "<S-Tab>", desc = "Previous buffer" },
      { "<C-Left>", desc = "Resize split left" },
      { "<C-Right>", desc = "Resize split right" },
    })
  end,
}