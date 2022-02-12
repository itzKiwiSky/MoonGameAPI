local utils = require 'API.misc.utils'
local screen = require 'API.window.screen'
local socket  = require("socket")

--start code
local progress = {}     -- index table definition
--external functions


function progress.clear()
    os.execute("cls")
end

-------------------------------------------------

--variables
local progressActive = 0                 --if == 1 continue loop
local progressAwait = 0                  --current progress value
local MaxValue = nil
local progressStyle = nil
local AddValue = nil
local messageString = nil
local waitTime = nil


-- create progress function
function progress.Create()
    progressActive = 1

    while progressActive == 1 do
        progressAwait = progressAwait + AddValue
        utils.sleep(waitTime)
        screen.clear()
        DrawProgress(progressStyle)

        if progressAwait >= MaxValue and progressActive == 1 then
            progressActive = 0
            progress.clear()    
        end

    end
    
end
---------------------------

--edit values function

function progress.AddValue(value)
    AddValue = value
end

function progress.WaitTime(value)
    waitTime = value
end

function progress.MaxValue(value)
    MaxValue = value
end

function progress.Message(value)
    messageString = value
end

function progress.StyleID(value)
    progressStyle = value
end

function progress.loadingColor(color1, color2)
    screen.color(color1, color2)
end

function progress.setup(addval, waitval, maxval, messagestr, styleid,autoCreate)
    progress.AddValue(addval)
    progress.MaxValue(maxval)
    progress.Message(messagestr)
    progress.StyleID(styleid)
    progress.WaitTime(waitval)
    if autoCreate == true then
        progress.Create()
    end
end


function progress.Version()
    print("Progress Utitlites")
    print("By BakaDoge")
    print("Version 1.2")
end

function DrawProgress(styleArgs)
    
    if styleArgs == 0 then
        print(messageString .. "[" .. progressAwait .. "]" .. "%")
    end
   
    if styleArgs == 1 then
        print("-=[" .. messageString .. " " .. "(" .. progressAwait .. "%" .. ")" .. "]=-")
    end
  
       
    if styleArgs == 2 then
        print("====================================")
        print("      " .. messageString .. " " .. "(" .. progressAwait .. "%" .. ")")
        print("====================================")
    end
  
       
    if styleArgs == 3 then
        print("####################################################")
        print("         " .. messageString .. "##" .. "[" .. progressAwait .. "%" .."]")
        print("####################################################")

    end

    if styleArgs == 4 then
        print("[][][][][][][][][][][][][][][][][][][]][][][][][][][][][][][][]")
        print(" ")
        print("         " .. "-============================-")
        print("                  " .. "-=[" .. progressAwait .. "%" .. "]=-")
        print("         " .. "-============================-")
        print(" ")
        print("[][][][][][][][][][][][][][][][][][][]][][][][][][][][][][][][]")
    end

end

function progress.ForceDraw(styleArgs)

    function checkValues()
        if progressActive ~= 0 then
            return
        else
            messageString = "Example Message"
            progressAwait = 10
        end
    end

    checkValues()
    
    if styleArgs == 0 then
        print(messageString .. "[" .. progressAwait .. "]" .. "%")
    end
   
    if styleArgs == 1 then
        print("-=[" .. messageString .. " " .. "(" .. progressAwait .. "%" .. ")" .. "]=-")
    end
  
       
    if styleArgs == 2 then
        print("====================================")
        print("      " .. messageString .. " " .. "(" .. progressAwait .. "%" .. ")")
        print("====================================")
    end
  
       
    if styleArgs == 3 then
        print("####################################################")
        print("         " .. messageString .. "##" .. "[" .. progressAwait .. "%" .."]")
        print("####################################################")

    end

    if styleArgs == 4 then
        print("[][][][][][][][][][][][][][][][][][][]][][][][][][][][][][][][]")
        print(" ")
        print("         " .. "-============================-")
        print("                  " .. "-=[" .. progressAwait .. "%" .. "]=-")
        print("         " .. "-============================-")
        print(" ")
        print("[][][][][][][][][][][][][][][][][][][]][][][][][][][][][][][][]")
    end

    local MaxValue = nil
    local progressStyle = nil
    local AddValue = nil
    local messageString = nil
    local waitTime = nil

end

function progress.ValueTable()
    print(AddValue)
    print(waitTime)
    print(MaxValue)
    print(messageString)
    print(progressStyle)
end


return progress 



--[[
        functions
progress.Create()
progress.Edit()
progress.Version()
-------------------------------------------------------
        debug functions
progress.ForceDraw()
progress.ValueTable()
]]--