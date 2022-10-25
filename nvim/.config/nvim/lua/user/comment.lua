local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
    -- LHS of toggle mappings in NORMAL and VISUAL modes
    toggler = {
        line = '<leader>cc',
        block = '<leader>bc',
    },
    -- LHS of operator-pending mappings in NORMAL and VISUAL modes
    opleader = {
        line = '<leader>c',
        block = '<leader>b',
    },
    -- LHS of extra mappings
    extra = {
        -- Add comment on line above
        above = '<leader>cO',
        -- Add comment on line below
        below = '<leader>co',
        -- Add comment at end of line
        eol = '<leader>cA',
    },
}

