window = {}

function window.title(str)
    if str ~= nil then
        os.execute("title " .. str)
    else
        os.execute("title Made with MoonGame API")
    end    
end


function window.size(width, height)
    if width or height ~= nil then
        os.execute("mode " .. width .. "," .. height)
    else
        os.execute("mode 32,32")
    end
end

return window