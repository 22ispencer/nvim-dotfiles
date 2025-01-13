local function walk_directory(dir)
    local handle = vim.loop.fs_scandir(dir)
    if not handle then
        print("Could not open directory: " .. dir)
        return
    end

    while true do
        local name, t = vim.loop.fs_scandir_next(handle)
        if not name then
            break  -- No more entries
        end

        print(name, t)  -- Print the name and type (file or directory)
    end
end

-- Example usage
walk_directory(vim.fn.stdpath("config"))  -- Walk the Neovim config directory

