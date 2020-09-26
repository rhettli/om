-- when the install this plugs ,the init.lua will be run one times.

--https://gitee.com/oshine/cwm/raw/master/init.lua

--curl https://gitee.com/oshine/cwm/raw/master/init.lua  -s

--print('dir:==', dir(''))
--print(_DIR)
--print('pwd:==', pwd())

install_dir = home() .. '/cwm'

package.path = install_dir .. '/?.lua;' .. package.path .. ';'

print("package.path:===", package.path)

local args1 = args()
table.remove(args1, 1)
if os() == 'windows' then
    if args1[1] == 'cwm' then
        table.remove(args1, 1)
    end
else
    -- handler for cmdline [cwm cmd oshine/cw_unix_cmd windows]
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
    return
end

print('CWM get real args:===', json_encode(args1))

if in_array(args1[1], { 'install', '-i', 'i' }) then
    require('oshine.cwm.installer'):new(args1[2] or pwd()):install()
    return
end

local any_time = require('oshine.cw_any_type.anyType'):new(args1)
local capture = require('oshine.cw_args_capture.capture'):new(any_time:sliceToRight(1))

capture:catch('login', function(login_c)
    print('login ready>>>')
    local member = require('oshine.cwm.api.member'):new()
    local email = login_c:catchNext()
    member:login(email)

end)   :catch('logout', function()
    print('logout ...')
    require('oshine.cwm.api.member'):new():logout()

end)   :catch('install', function(c)
    c:catch('plugs', function()
        -- install self , just copy self folder to cwm package folder make sure you can load the lib anywhere
        -- install dir is [~/username/cwm/]
        require('oshine.cwm.installer'):new(args1[3] or pwd()):install_plugs()
    end)
end)   :catch('send', function(c, is_show_help)
    if is_show_help then
        return [[cwm send his]]
    end

    -- 发送文件给好友
    c   :catch('user', function(user_c)
        local user = user_c:catchNext() --or user_c:catchArg({ '-u', '--user' })
        local file = user_c:catchNextAll() --or user_c:catchArg({ '-f', '--file' })

    end):catch({ 'his', 'history' }, function()

    end):catch({ 'list', 'ls' }, function()

    end):catch({ 'que', 'queue' }, function()

    end):run()

end)   :catch({ 'pro', 'program' }, function()

end)   :catch({ 'article', 'art' }, function()

end)   :catch({ 'fav', 'favorite' }, function()

end)   :catch('send', function()

end)   :catch('status', function(c)
    --c:trgger('pakcage.status')
end)   :catch('package', function(package_c, is_show_help)
    if is_show_help then
        return [[
        package  search bitmap
        package  list
        package  add package_name git_source title  [exp:package add oshine/bitmap gitee.com/oshine.bitmap "A 2d drawer"]
        package  search local bitmap
        package  list local
        ]]
    end

    local action = package_c:catchNext()
    if action == 'local' then
        -- exec local cmd line
        local pac = require('oshine.cwm.local_parse.package'):new()
        action = package_c:catchNext()
        if action == 'search' then
            pac:search()
        elseif action == 'list' then
            pac:status()
        end
        return
    end

    local pac = require('oshine.cwm.api.package'):new()
    if action == 'add' then
        local package_name = package_c:catchNext()
        local git_source = package_c:catchNext()
        pac:add(package_name, git_source)
    elseif action == 'search' then
        local key = package_c:catchNext()
        pac:search(key)
    elseif action == 'list' then
        pac:status()
    end

end)   :catch('search', function()

end)   :catch('plugs', function()
    if args1[2] == 'status' then
    elseif args1[2] == 'search' then
    elseif args1[2] == 'remote' then
        local plugs = require('oshine.cwm.api.plugs'):new()
        if args1[3] == 'recorder' then
            plugs:recorder()
        elseif args1[3] == 'add' then

        end
    end
end)   :run()
