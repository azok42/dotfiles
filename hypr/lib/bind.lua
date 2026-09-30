local M = {}

function M.bind(key, dispatcher, description)
    local flags = nil

    if description then
        flags = { description = description }
    end

    return hl.bind(key, dispatcher, flags)
end

function M.exec(key, command, description)
    return M.bind(key, hl.dsp.exec_cmd(command), description)
end

return M
