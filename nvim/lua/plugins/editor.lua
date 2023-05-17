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
      end, { desc = "Harpoon menu" })
      set("n", "<tab>m", function()
        require("harpoon.mark").add_file()
        print("Mark file to harpoon")
      end, { desc = "Mark file to harpoon" })
      set("n", "<tab>1", function()
        ui.nav_file(1)
      end, { desc = "Navigate to harpoon file 1" })
      set("n", "<tab>2", function()
        ui.nav_file(2)
      end, { desc = "Navigate to harpoon file 2" })
      set("n", "<tab>3", function()
        ui.nav_file(3)
      end, { desc = "Navigate to harpoon file 3" })
      set("n", "<tab>4", function()
        ui.nav_file(4)
      end, { desc = "Navigate to harpoon file 4" })
      set("n", "<tab>5", function()
        ui.nav_file(5)
      end, { desc = "Navigate to harpoon file 5" })
      set("n", "<tab>n", function()
        ui.nav_next()
      end, { desc = "Next harpoon marker" })
      set("n", "<tab>p", function()
        ui.nav_prev()
      end, { desc = "Previous harpoon marker" })
    end,
  },
  {
    "mbbill/undotree",
    init = function()
      vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
    end,
  },
}
