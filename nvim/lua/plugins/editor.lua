return {
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({})
    end,
    init = function()
      local set = vim.keymap.set
      local ui = require("harpoon.ui")
      set("n", "<tab><tab>", function()
        ui.toggle_quick_menu()
      end)
      set("n", "<tab>m", function()
        require("harpoon.mark").add_file()
        print("Mark file to harpoon")
      end)
      set("n", "<tab>1", function()
        ui.nav_file(1)
      end)
      set("n", "<tab>2", function()
        ui.nav_file(2)
      end)
      set("n", "<tab>3", function()
        ui.nav_file(3)
      end)
      set("n", "<tab>4", function()
        ui.nav_file(4)
      end)
      set("n", "<tab>5", function()
        ui.nav_file(5)
      end)
      set("n", "<tab>n", function()
        ui.nav_next()
      end)
      set("n", "<tab>p", function()
        ui.nav_prev()
      end)
    end,
  },
  {
    "mbbill/undotree",
    init = function()
      vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
    end,
  },
}
