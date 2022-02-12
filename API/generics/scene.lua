local window = require 'API.window.mngr'
local screen = require 'API.window.screen'

scene = {}


function scene.switch(name, clear)

    if name ~= nil then
        sceneFile = io.open("./game/scenes/" .. name .. ".lua",  "r")
        if sceneFile ~= nil then
            io.close(sceneFile)
            if clear == true then
                screen.clear()
            end
            dofile("./game/scenes/" .. name .. ".lua")
        else
            print("Can`t reach out scene; invalid file or inexstent")      
        end
    else
        print("The scene field can`t be nil")
    end
end

return scene