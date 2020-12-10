-- https://gitee.com/oshine/cwm/repository/archive/master.zip
-- https://github.com/rhettli/cwm/archive/master.zip





local host = 'https://github.com/rhettli'
local r = readline('choose download trs.cw depend on your network,type:[1 gitee,2 github]:')
if r == 1 then
    host = 'https://gitee.com/oshine/cwm/repository'
end

download(host .. '/archive/master.zip', 'm.zip', function(percent)

end)

unzip('m.zip')
copy('m','')

unlink('m.zip')