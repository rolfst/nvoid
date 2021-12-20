local M = {}

-- Auto Pairs
M.autopairs = function ()
    local present1, autopairs = pcall(require, "nvim-autopairs")
    local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

    if present1 and present2 then
       autopairs.setup()
       local cmp = require "cmp"
       cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
       cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
    end
end

-- Commented
M.commented = function ()
  local present, commented = pcall(require, "commented")
  if not present then
     return
  end
  commented.setup({
	  keybindings = { n = "<leader>/", v = "<leader>/", nl = "<leader>/" },
      comment_padding = " ",
  })
end

-- Git Signs
M.git = function ()
  local present, gitsigns = pcall(require, "gitsigns")
  if present then
    gitsigns.setup {
      signs = {
      add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
    }
  end
end

-- colorizer
M.colorizer = function ()
  local present, colorizer = pcall(require, "colorizer")
  if present then
    colorizer.setup({ "*" }, {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = false,
        rgb_fn = false,
        hsl_fn = false,
        css = false,
        css_fn = false,
        mode = "background",
     })
  end
end

-- Better Escape
M.better = function ()
  local present, better_escape = pcall(require, "better_escape")
  if not present then
     return
  end
  better_escape.setup {
      mapping = {"jk", "jj"},
      timeout = vim.o.timeoutlen,
      clear_empty_lines = false,
      keys = "<Esc>",
  }
end

return M