local m = {}
local http = require('oshine.cwm.api.promise'):new()

function m:new()
    return self
end

function m:login(email)
    local psw = read_line('TypePsw', true)
    local device_no = str_replace(require('oshine.cw_device.device'):new():getDeviceNo(), '-', '')
    local form = { email = email, psw = psw, platform = os(), device_no = device_no }

    http:request('/api/member/login', { form = form })._then(function(r)
        if -1 ~= tonumber(r.code) and r.data then
            file_put_contents(require('oshine.cwm.conf').install_dir .. 'sid', r.data.sid)
            print(r.data.id, '|', r.data.nickname, 'login success')
        else
            print(r.msg)
        end
    end)
end

function m:search(member_name_or_id)
    http:request('/api/member/login', { body = { email = user, psw = psw } })._then(function(r)
        print(r)
    end)

end

return m