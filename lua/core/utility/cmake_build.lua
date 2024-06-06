cmake_build = {}


function cmake_build.build()
    -- 判断当前目录下是否有CMakeLists.txt
    local cwd = vim.fn.getcwd()
    local filename = cwd .. "/CMakeLists.txt"
    local file = io.open(filename, "r")
    if file then
        io.close(file)
        vim.fn.system(string.format("mkdir build"))
        vim.fn.system(string.format("cmake -S . -B build"))
        vim.fn.system(string.format("cmake --build build"))

        vim.notify("build finished", vim.log.levels.INFO)
        return true
    else
        vim.notify("No CMakeLists.txt.", vim.log.levels.WARN)
        return false
    end

    -- os.execute(string.format("mkdir build"))
    -- os.execute(string.format("cmake -S . -B build"))
    -- os.execute(string.format("cmake --build build"))
end

return cmake_build
