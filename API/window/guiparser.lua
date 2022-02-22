local powerwrite = require 'API.moon'

gui = {}

function gui.render(filename)
    file = io.open("game/objs/" .. filename .. ".gui", "r")
    lines = file:lines()
    assert(file ~= nil, "[MoonGame] - {API.window.guiparser} :: file can't be nil")
    for i in lines do
        print(i)
    end
end

return gui