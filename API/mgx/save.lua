local folder = require 'API.generics.filesystem.file'


save = {}


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

function save.write(savefile, content)
    saveFile = io.open(savefile .. ".save", "r")
    if not saveFile then
        print("[MoonEngine] - {API.mgx.save} :: Save file don't exist")
        os.exit(0)
    else
        os.execute("@echo " .. content .. '>"%cd%/"' .. savefile .. ".save")
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

return save