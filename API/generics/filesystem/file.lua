
file = {}

function file.mkfolder(name)
    if name == nil or name == " " then
        print("[MoonEngine] - {API.generics.filesystem} :: the function parameter can't be 'nil'.")
        os.exit(0)
    else
        os.execute("mkdir " .. name)
    end
end

function file.rmfolder(name)
    if name == nil or name == " " then
        print("[MoonEngine] - {API.generics.filesystem} :: the function parameter can't be 'nil'.")
        os.exit(0)
    else
        os.execute("rmdir " .. name)
    end  
end

return file