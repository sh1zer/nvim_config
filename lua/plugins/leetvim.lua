return {
  "sh1zer/leet.nvim",
  event = "VeryLazy",
  config = function()
    require("leetvim").setup({
      -- Optional configuration
      result_split_command = "botright vsplit", -- "vertical" or "horizontal" split behavior
      leetcode_storage_path = os.getenv("HOME") .. "/.leetcode/code/", -- path to generated files

      -- Default keymaps (set to false or nil to disable)
      keymaps = {
        menu = "<leader>zm",
        test = "<leader>zt",
        submit = "<leader>zs",
      },
    })
  end,
}
