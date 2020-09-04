-- when the install this plugs ,the init.lua will be run one times.


local ext
if os() == "windows" then
    ext = 'bat'
else
    ext = 'sh'
end

exec(_DIR .. '/bin/cwm.' .. ext)

print('install cwm done.')