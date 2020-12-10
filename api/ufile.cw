local class_cloud_file = {}
local http = require('oshine.cwm.api.promise'):new()

function class_cloud_file:new()
    return self
end

function class_cloud_file:read(member_name_or_id)
    http:request('/api/member/login', { body = { email = user, psw = psw } })._then(function(r)
        print(r)
    end)

end
function class_cloud_file:search(member_name_or_id)
    http:request('/api/member/login', { body = { email = user, psw = psw } })._then(function(r)
        print(r)
    end)

end

return class_cloud_file
