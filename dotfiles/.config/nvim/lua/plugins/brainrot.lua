return {
  {
    "sahaj-b/brainrot.nvim",
    event = "VeryLazy",
    opts = {

      disable_phonk = false, -- skip phonk/overlay on "no errors"
      phonk_time = 2.5, -- seconds the phonk/image overlay stays
      min_error_duration = 0.5, -- minimum seconds errors must exist before phonk triggers (0 = instant)
      block_input = false, -- block input during phonk/overlay
      dim_level = 60, -- phonk overlay darkness 0..100

      sound_enabled = true, -- enable sounds
      image_enabled = true, -- enable images (needs image.nvim)

      boom_volume = 50, -- volume for vine boom sound (0..100)
      phonk_volume = 50, -- volume for phonk sound (0..100)

      boom_sound = nil, -- custom boom sound path (e.g., "~/sounds/boom.ogg")
      phonk_dir = nil, -- custom phonk folder path (e.g., "~/sounds/phonks")
      image_dir = nil, -- custom image folder path (e.g., "~/memes/images")

      lsp_wide = false, -- track errors workspace-wide(get ALL lsp errors)
    },
  },
  {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      processor = "magick_cli",
    },
  },
}
