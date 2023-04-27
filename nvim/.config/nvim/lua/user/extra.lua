local M = {}

local rust_tools_ok, rust_tools = pcall(require, 'rust-tools')
if rust_tools_ok then
    -- Hints off by default
    local inlay_hints_enabled = false
    function M.toggle_inlay_hints()
        if inlay_hints_enabled then
            inlay_hints_enabled = false
            rust_tools.inlay_hints.unset()
            print("Unset inlay hints")
        else
            inlay_hints_enabled = true
            rust_tools.inlay_hints.set()
            print("Set inlay hints")
        end
    end
end

return M
