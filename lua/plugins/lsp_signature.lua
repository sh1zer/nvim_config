return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = true,
    toggle_key = "<c-s>",
    toggle_key_flip_floatwin_setting = true,

    floating_window_above_cur_line = false,
    floating_window_off_x = 40,
    floating_window_off_y = -5,
    max_width = 40,
    wrap = true,

    max_height = 5,
    doc_lines = 0,
  },
}
