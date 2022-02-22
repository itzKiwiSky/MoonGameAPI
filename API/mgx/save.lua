moon = require 'API.moon'
stringx = require 'pl.stringx'

save = {}

saveVersion = "0.0.2"

function save.create(packageName)
     assert(packageName ~= nil, "[MoonGame] - {API.mgx.save} :: The save package name can't be nil")

     if exist(packageName) then
          moon.write("The save file already exist.", "red", "black")
     else
          os.execute("powershell new-item " .. packageName .. ".save")
          os.execute("powershell add-content %cd%/" .. packageName .. ".save" .. ' "start:head')
          os.execute("powershell add-content %cd%/" .. packageName .. ".save" .. ' "version:' .. saveVersion)
     end
end

function save.write(packageName, chunk, value)
     assert(exist(packageName), "[MoonGame] - {API.mgx.save} :: The Save file don't exist, create one using save.create()")
     assert(chunk ~= nil or value ~= nil, "[MoonGame] - {API.mgx.save} :: Chunk or Value can't be nil")
     os.execute("powershell add-content %cd%/" .. packageName .. ".save" .. ' ' .. chunk .. ":" .. value)
end

--[[
function save.read(packageName, chunkName)
     file = io.open(packageName, ".save", "rb")
     local i = 0
     local saveToken = {}
     for i in file.lines() do
          if stringx.lfind(i, chunkName) then
               
          end
     end
end
]]--


function exist(package)
     file = io.open(package .. ".save", "r")
     
     if file == nil then
          return false
     else
          return true
     end
end

return save