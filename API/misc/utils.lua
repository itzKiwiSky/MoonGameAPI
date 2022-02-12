local socket = require('socket')
utils = {}

function utils.sleep(ms)
    socket.select(nil, nil, ms)
end

function utils.pause(nul)
    if nul == true then
        os.execute("pause >nul")
    end
    if nul == false or nul == nil then
        os.execute("pause")
    end
end

return utils