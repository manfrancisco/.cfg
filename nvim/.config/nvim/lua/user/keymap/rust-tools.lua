local M = {}

local nmap = function(k, v)
    vim.keymap.set("n", k, v, { silent = true })
end

M.map_keys = function()
    nmap("<leader>rh", "<CMD>RustToggleInlayHints<CR>")
    nmap("<leader>rr", "<CMD>RustRunnables<CR>")
    nmap("<leader>rem", "<CMD>RustExpandMacro<CR>")
    nmap("<leader>rom", "<CMD>RustOpenCargo<CR>")
    nmap("<leader>rpm", "<CMD>RustParentModule<CR>")
    nmap("<leader>rjl", "<CMD>RustJoinLines<CR>")
    nmap("<leader>rha", "<CMD>RustHoverActions<CR>")
    nmap("<leader>rhr", "<CMD>RustHoverRange<CR>")
    nmap("<leader>rmj", "<CMD>RustMoveItemDown<CR>")
    nmap("<leader>rmk", "<CMD>RustMoveItemUp<CR>")
    nmap("<leader>rd", "<CMD>RustDebuggables<CR>")
    nmap("<leader>rv", "<CMD>RustViewCrateGraph<CR>")
    nmap("<leader>rw", "<CMD>RustReloadWorkspace<CR>")
    nmap("<leader>rss", "<CMD>RustSSR<CR>")
    nmap("<leader>rxd", "<CMD>RustOpenExternalDocs<CR>")
end

return M
