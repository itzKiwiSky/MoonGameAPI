local powerprint = require 'API.generics.write'

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


-- return function print with color system [MoonGame] - {API.window.writeColor}

function moon.write(text, color1, color2)
    powerprint.write(text, color1, color2)
end

return moon