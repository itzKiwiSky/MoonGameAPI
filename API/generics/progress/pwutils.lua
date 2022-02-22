stringx = require "pl.stringx"
screen = require 'API.window.screen'
utils = require 'API.misc.utils'

pwprogress = {}

-- values

local addValue              = nil
local maxValue              = nil
local waitTime              = nil
local message               = nil
local styleID               = nil
local pattern               = nil



-- engine
local progressPercentage = 0

function pwprogress.create()
    if addValue == nil or
    maxValue == nil or
    waitTime == nil or
    message == nil or
    message == nil then
        print("[MoonGame] - {API.generics.progress.pwutils} :: Invalid arguments or nil")
        os.exit(0)
    end

    repeat
        currentBar = stringx.ljust(" ", progressPercentage, pattern)
        screen.clear()
        progressPercentage = progressPercentage + addValue
        print("-==========[ " .. message .. " ]==========-")
        print("[" .. currentBar)
        print("-==========[ @@@@@@@@@@@ ]==========-")
        utils.sleep(waitTime)
    until progressPercentage >= maxValue
end

function pwprogress.attributes(addVal, maxVal, messagestr, waitms, pat)
    addValue = addVal
    maxValue = maxVal
    waitTime = waitms
    message = messagestr
    pattern = pat
end

return pwprogress