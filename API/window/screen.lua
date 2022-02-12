screen = {}

function screen.clear()
    os.execute("cls")
end

function screen.color(color1, color2)
    if color1 or color2 ~= nil then
        os.execute("color " .. color1, color2)
    else
        os.execute("color 07")
    end
end

return screen