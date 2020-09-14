-- when the install this plugs ,the init.lua will be run one times.

--https://gitee.com/oshine/cwm/raw/master/init.lua

--curl https://gitee.com/oshine/cwm/raw/master/init.lua  -s


local ext

-- cwm login -u root -p oshine
-- cw.exe cwm.lua login -u root -p oshine
-- cwm status

local args1 = args()
table.remove(args1, 1)

print('CWM get real args:===', json_encode(args1))

if args1[1] == 'login' then
print('login start with')
elseif in_array(args1[1], { '-i', 'i', 'install' }) then

elseif args1[1] == 'status' then

elseif args1[1] == 'install' then -- install other package
    require('oshine.cwm.installer').install()

elseif in_array(args1[1], { '-h', '--help' }) then
    print('you may use like this')
end