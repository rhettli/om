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

if args1[1] == 'login' then


elseif args1[1] == 'logout' then
    print('login start with')

elseif args1[1] == 'install' and args1[2] and args1[2] == 'plugs' then
    -- install self , just copy self folder to cwm package folder make sure you can load the lib anywhere
    -- install dir is [~/username/cwm/]
    require('oshine.cwm.installer'):new(args1[3] or pwd()):install_plugs()

elseif in_array(args1[1], { '-i', 'i', 'install' }) then

    require('oshine.cwm.installer'):new(args1[1] or pwd()):install()

elseif args1[1] == 'cmd' then
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
elseif args1[1] == 'status' then
elseif args1[1] == 'package' then
    if args1[2] == 'search' then

    elseif args1[2] == 'status' then

    end
elseif args1[1] == 'search' then

elseif args1[1] == 'plugs' then
    if args1[2] == 'status' then
    elseif args1[2] == 'search' then
    elseif args1[2] == 'remote' then
        local plugs = require('oshine.cwm.api.plugs'):new()
        if args1[3] == 'recorder' then
            plugs:recorder()
        elseif args1[3] == 'add' then

        end
    end
elseif in_array(args1[1], { '-h', '--help' }) then
    print('you may use like this')
end