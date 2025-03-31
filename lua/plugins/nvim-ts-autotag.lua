return 
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    ft = {"html", "xml", "markdown" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  }

