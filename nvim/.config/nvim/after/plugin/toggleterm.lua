local toggleterm = require("toggleterm")

toggleterm.setup()

vim.keymap.set("n", "tt", ":ToggleTerm<cr>")
