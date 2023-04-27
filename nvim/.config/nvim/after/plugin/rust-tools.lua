local ok, rust_tools = pcall(require, 'rust-tools')
if not ok then return end

rust_tools.setup({
    tools = {
        inlay_hints = {
            auto = false,
        }
    }
})
