local folder = require 'API.generics.filesystem.file'


save = {}

saveValue = {}
saveChunk = {}


function save.create(gameName)
    if gameName ~= nil or gameName ~= " " then
        os.execute("@echo off")
        os.execute('@echo.>"%cd%/' .. gameName .. ".save")
        return gameName
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

function save.remove(savefile)
    saveFile = io.open(savefile .. ".save", "r")
    if not saveFile then
        print("[MoonEngine] - {API.mgx.save} :: Save file don't exist")
        os.exit(0)
    else
        os.execute("type nul > %cd%/" .. savefile .. ".save")
    end
end

function save.load(savefile)
    local file = io.open(savefile .. ".save")
    checkSaveIntegrity(file)
    if file then
        for line in file:lines() do
            local value, savechunk = unpack(line:split(":"))
            table.insert(saveValue, line, value)
            table.insert(saveChunk, line, savechunk)
        end
    else
        print("[MoonEngine] - {API.mgx.save} :: file cannot be loaded")
        os.exit(0)
    end
end

function checkSaveIntegrity(savefile)
    if saveValue[0] == 'saveStart' then
        if saveChunk[0] == 'head' then
        else
            print("[MoonEngine] - {API.mgx.save} :: Save file is not valid (invalidSaveChunk)")
        end
    else
        print("[MoonEngine] - {API.mgx.save} :: Save file is not valid (invalidValue)")
        os.exit(0)
    end
end

return save