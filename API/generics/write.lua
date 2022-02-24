powerprint = {}

function powerprint.write(text, color1, color2)
   os.execute("powershell write-host " .. text .. " -backgroundColor " .. color1 .. " -foregroundColor " .. color2)
end

return powerprint