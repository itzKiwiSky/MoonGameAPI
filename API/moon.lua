stringx = require 'pl.stringx'

moon = {}

version = [[
====================================
    Moon Terminal game API

            [v1.0.1]

    Created by ChocolateLoxtl_
====================================
]]

function moon.version()
    print(version)
end

function moon.gameInfo(info)
    if info == nil then
        file = io.open("game.ore")
        lines = file:lines()
        outInfo = {}
        for line in lines do
            i = i + 1
            if string.find(line, info) then
                outInfo = stringx.split(line, "::")
                return outInfo[2]
            end
        end
    else
        print("[MoonGame] - {API.moongame} :: Can't read game info file")
        os.exit(0)
    end
end

return moon