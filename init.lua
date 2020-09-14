-- when the install this plugs ,the init.lua will be run one times.

--https://gitee.com/oshine/cwm/raw/master/init.lua

--curl https://gitee.com/oshine/cwm/raw/master/init.lua  -s


local ext
if os() == "windows" then
    ext = 'bat'
else
    ext = 'sh'
end

exec(_DIR .. '/bin/cwm.' .. ext)

print('install cwm done.')