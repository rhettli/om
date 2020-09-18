-- when the install this plugs ,the init.lua will be run one times.

--https://gitee.com/oshine/cwm/raw/master/init.lua

--curl https://gitee.com/oshine/cwm/raw/master/init.lua  -s

--print('dir:==', dir(''))
--print(_DIR)
--print('pwd:==', pwd())

install_dir = home() .. '/cwm'

package.path = install_dir .. '/?.lua;' .. package.path .. ';'

print("package.path:===", package.path)
local ext

-- cwm login -u root -p oshine
-- cw.exe cwm.lua login -u root -p oshine
-- cwm status

local args1 = args()
table.remove(args1, 1)

print('CWM get real args:===', json_encode(args1))
local any_time = require('oshine.cw_any_type')
local cacher = require('oshine.cw_args_cacher'):new(any_time:newValue(args1):slice(1, -1))

cacher:ready(args1[1]):cache('login', function()
    local member = require('oshine.cwm.api.member'):new()
    member:login(args1[2], args1[3])

end)  :cache('logout', function()
    print('login start with')
end)  :cache('install', function()
    cacher:cache('plugs', function()
        -- install self , just copy self folder to cwm package folder make sure you can load the lib anywhere
        -- install dir is [~/username/cwm/]
        require('oshine.cwm.installer'):new(args1[3] or pwd()):install_plugs()
    end)
end)  :cache('install', '-i', 'i', function()
    require('oshine.cwm.installer'):new(args1[1] or pwd()):install()
end)  :cache('send', '-i', 'i', function(catch)
    -- 发送文件给好友
    catch:cache('user', function()

    end) :cache('his', 'history', function()

    end) :cache('list', 'ls', function()

    end) :cache('que', 'queue', function()

    end) :cacheHelp(function()
        return [[cwm send his]]
    end)
end)  :cache('install', '-i', 'i', function()
    print('login start with')
end)  :cache('pro', 'program', function()

end)  :cache('article', 'art', function()

end)  :cache('fav', 'favorite', function()

end)  :cache('send', function()

end)  :cache('cmd', function()
    -- internal cmd
    -- cwm _cmd oshine/bitmap check
    if #args1 > 2 then
        local r = require(args1[2] .. '.cmd.' .. args1[3])
        local p = {}
        if #args1 > 3 then
            local index = 1
            for i, v in pairs(args1) do
                if index > 3 then
                    p[i] = v
                end
                index = index + 1
            end
        end
        r.run(p)
    end
end)  :cache('status', function()

end)  :cache('package', function()
    if args1[2] == 'search' then

    elseif args1[2] == 'status' then

    end
end)  :cache('search', function()

end)  :cache('plugs', function()
    if args1[2] == 'status' then
    elseif args1[2] == 'search' then
    elseif args1[2] == 'remote' then
        local plugs = require('oshine.cwm.api.plugs'):new()
        if args1[3] == 'recorder' then
            plugs:recorder()
        elseif args1[3] == 'add' then

        end
    end
end)  :cache('-h', '--help', function()
    print('you may use like this')
end)  :run()
