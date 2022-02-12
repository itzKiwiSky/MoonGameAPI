local window = require 'API.window.mngr'
local screen =  require 'API.window.screen'

setup = {}

function setup.initialize(width, height, text)
    window.size(width, height)
    window.title(text) 
end

return setup