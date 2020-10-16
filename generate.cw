return {
    vendor = function(package_dir)

        local luaStr = [[
local f = rtrim(_DIR, '/')
local dir = str_split(f, '/')
_dir_name = dir[#dir]
_dir_name = _dir_name .. '/'
install_dir=%s

local work_dir = rtrim(f, _dir_name) .. '/'

package.path = package.path .. ';' .. work_dir .. '?.lua;' .. _VENDOR .. '/?.lua;'.. install_dir .. '/?.lua;'

--out(dir, _dir_name, "\n", package.path)

_current_dir = function()
    local t = debug.traceback()
    local arr = str_split(t, "\n")
    local ind = string.find(arr[3], '\:')
    return string.sub(arr[3], 0, ind)
end

_stack = function()
    out(debug.traceback())
end


-- 清楚模块缓存
function _remove_package_cache(preName)
    for key, _ in pairs(package.preload) do
        --out('preload:' .. key .. preName)
        if string.find(tostring(key), preName) == 1 then
            package.preload[key] = nil
        end
    end

    for key, _ in pairs(package.loaded) do
        --out('loaded:' .. key ..':'.. preName)
        if key == preName then
            --out('*-*-*-')
            package.loaded[key] = nil
        end
        --if string.find(key, preName) == 1 then
        --
        --    package.loaded[key] = nil
        --end
    end
end

]]
        local conf = require('oshine.cwm.conf')
        luaStr = string.format(luaStr, conf.install_dir)

        err2 = file_put_contents(package_dir .. "/vendor/autoload.lua", luaStr)
        if err2 == nil then
            fmt.Println("can write file:vendor/autoload.lua")
        end
    end
}