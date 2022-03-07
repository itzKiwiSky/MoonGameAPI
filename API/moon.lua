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
end

return moon