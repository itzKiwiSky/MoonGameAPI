
file = {}

function file.mkfolder(name)
    exist = os.rename(name, name)
    if not exist then
        if name == nil or name == " " then
            print("[MoonEngine] - {API.generics.filesystem} :: the function parameter can't be 'nil'.")
            os.exit(0)
        else
            os.execute("mkdir " .. name)
        end
    end
end

return file