local utils = require 'API.misc.utils'
local window = require 'API.window.mngr'
local screen =  require 'API.window.screen'
local scene = require 'API.generics.scene'
local setup = require 'API.generics.setup'
local save = require 'API.mgx.save'

boot = {}


function boot.init(initscene)
    screen.clear()
    setup.initialize(65, 32, "")
    print("game with MoonEngine!")
    utils.sleep(3)
    scene.switch(initscene, true)
end

return boot