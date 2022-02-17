local folder = require 'API.generics.filesystem.file'
local stringx = require 'pl.stringx'
local tablex = require 'pl.tablex'

save = {}



function save.create(gameName)
    if gameName ~= nil or gameName ~= " " then
        os.execute("@echo off")
        os.execute("powershell new-item " .. gameName .. ".save")
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
        if chunkid == nil or value == nil then
            chunkname = "start"
            value = "head"
            os.execute("powershell add-content" .. saveFile .. " start:head" )
        else
            os.execute("powershell add-content" .. saveFile .. " " .. chunkname .. ":" .. value)
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

    if not returnSaveIntegrity(savefile, 1) then
        print("[MoonEngine] - {API.mgx.save} :: Save file is not valid - (invalidHeader)")
        os.exit(0)
    end
    if returnSaveIntegrity(savefile, 1) == 'null header' then
        print("[MoonEngine] - {API.mgx.save} :: Save file is not valid - (nullHeader)")
        os.exit(0) 
    end
end

function returnSaveIntegrity(savefile, chunkID)
    chunkTokenizer = {}
    saveChunk = nil
    file = io.open(savefile .. ".save")
    for line in file:lines() do
        i = i + 1
        if i == chunkID then
            saveChunk = line
            return line
        end
    end
    chunkTokenizer = stringx.split(line, ":")

    if chunkTokenizer[1] == nil then
        return 'null header'
    end
    if chunkTokenizer[2] == nil then
        return 'null header'
    end
    if chunkTokenizer[1] ~= "start" then
        return false
    else
        if chunkTokenizer[2] ~= 'head' then
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