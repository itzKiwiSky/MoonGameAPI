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

function moon.info(gamename, version, author, description)
    if gamename == nil then
        gamename = "MoonGameAPI Game"
        return gamename
    else
        return gamename
    end 
    if version == nil then
        version = "1.0.0"
        return version
    else
        return version
    end 
    if description == nil then
        description = "MoonGameAPI Game"
        return description
    else
        return description
    end
    return author 
end

return moon