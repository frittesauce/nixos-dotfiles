return {
  "andweeb/presence.nvim",
  config = function()
    require("presence").setup({
      -- General options
      auto_update = true,
      neovim_image_text = "on my coding winter arc",
      main_image = "neovim", -- Main image display (either "neovim" or "file")
      client_id = "793271441293967371",
      log_level = nil,
      debounce_timeout = 10,
      enable_line_number = false,
      blacklist = {},
      file_assets = {},
      show_time = true,

      -- Rich Presence text options
      editing_text = "Editing...",
      file_explorer_text = "Browsing...",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading....",
      workspace_text = "Working.....",
      line_number_text = "Line %s out of %s",
    })
  end,
}
