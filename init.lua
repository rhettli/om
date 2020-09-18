-- when the install this plugs ,the init.lua will be run one times.

--https://gitee.com/oshine/cwm/raw/master/init.lua

--curl https://gitee.com/oshine/cwm/raw/master/init.lua  -s

-- 用户付款后 才能制作加密应用
-- 更新后，客户端下载file表中的文件即可

local ext
if os() == "windows" then
    ext = 'bat'
else
    ext = 'sh'
end

exec(_DIR .. '/bin/cwm.' .. ext)

print('install cwm done.')