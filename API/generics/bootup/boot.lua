local utils = require 'API.misc.utils'
local window = require 'API.window.mngr'
local screen =  require 'API.window.screen'
local scene = require 'API.generics.scene'
local setup = require 'API.generics.setup'
local save = require 'API.mgx.save'

boot = {}
moon = [[
          .::::::::::.
        .::::::::::::::.
       ::::::::::::::::::
       ::::::::::::::::::
       ::::::::::::::::::
       ::::::::::::::::::
       ::::::::::::::::::
        ':::::::::::::::'
          ':::::::::::'
]]

function boot.init(initscene)
    screen.clear()
    setup.initialize(65, 32)
    utils.sleep(3)
    animateMoon()
    scene.switch(initscene, true)
end

function animateMoon()
    rgbColor = 0
    screen.color(0, 7)
    animation = true
    loopRgb = 0
    print("")
    print(" ")
    print(" ")
    print("            made with MoonGame!")
    print(" ")
    print(moon)
    while animation do
        rgbColor = rgbColor + 1
        utils.sleep(0.08)
        if rgbColor >= 9 then
            rgbColor = 0
            loopRgb = loopRgb + 1
        end
        if loopRgb >= 3 then
            animation = false
        end
        screen.color(0, rgbColor)
    end

end

return boot