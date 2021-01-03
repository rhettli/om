local class_article = {}
local http = require('oshine.cwm.api.promise'):new()

function class_article:new()
    return self
end

function class_article:read(member_name_or_id)
    http:request('/api/member/login', { body = { email = user, psw = psw } })._then(function(r)
        print(r)
    end)

end
function class_article:search(member_name_or_id)
    http:request('/api/member/login', { body = { email = user, psw = psw } })._then(function(r)
        print(r)
    end)

end

return class_article
