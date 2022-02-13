local folder = require 'API.generics.filesystem.file'


save = {}



function save.create(gameName)
    if gameName ~= nil or gameName ~= " " then
        os.execute("@echo off")
        os.execute('@echo.>"%cd%/' .. gameName .. ".save")
    else
        print("[MoonEngine] - {API.mgx.save} :: Save name can not be 'Nil'")
        os.exit(0)
    end
end

function save.write(savefile, chunkname, value)
    saveFile = io.open(savefile .. ".save", "r")
    if not saveFile then
        print("[MoonEngine] - {API.mgx.save} :: Save file don't exist")
        os.exit(0)
    else
        if chunkname == nil or value == nil then
            os.execute("@echo " .. "saveStart:head" .. '>"%cd%/"' .. savefile .. ".save")
        else
            os.execute("@echo " .. chunkname .. ":" .. value .. '>"%cd%/"' .. savefile .. ".save")
        end
    end
end

function save.erase(savefile)
    saveFile = io.open(savefile .. ".save", "r")
    if not saveFile then
        print("[MoonEngine] - {API.mgx.save} :: Save file don't exist")
        os.exit(0)
    else
        os.execute("type nul > %cd%/" .. savefile .. ".save")
        save.write(savefile)
    end
end


function save.returnChunk(savefile, chunkID)
    local i = 0
    local file = io.open(savefile .. ".save")

    if file then
        for line in file:lines() do
            i = i + 1
            if i == chunkID then
                return line
            end
        end
    else
        print("[MoonEngine] - {API.mgx.save} :: Save file don't exist")
        os.exit(0)       
    end

    --save exceptions

    if not returnSaveIntegrity(savefile) then
        print("[MoonEngine] - {API.mgx.save} :: Save file is not valid - (invalidHeader)")
        os.exit(0)
    end
    if returnSaveIntegrity() == 'null header' then
        print("[MoonEngine] - {API.mgx.save} :: Save file is not valid - (nullHeader)")
        os.exit(0) 
    end
end

function returnSaveIntegrity(savefile)
    chunk =  save.returnChunk(savefile, 1)
    if chunk == nil then
        return 'null header'
    else
        if chunk ~= 'saveStart:head' then
            return false
        else
            return true
        end
    end
end

function save.exist(savefile)
    file = io.open(savefile .. ".save")
    if file == nil then
        return false
    else
        return true
    end
end

return save