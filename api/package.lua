local m = {}
local http = require('oshine.cwm.api.promise'):new()

function m:new()
    return self
end

function m:add(package_name, git_source)
    print('', package_name, git_source)
    if not is_valid(package_name, git_source) then
        print('package_name or git_source is empty')
        return
    end

    local form_ = { package_name = package_name, git_source = git_source }

    http:request('/api/cw_package/add', { form = form_ })._then(function(r)
        if -1 ~= tonumber(r.code) and r.data then
            print(package_name .. ' add success ,with git_source:' .. git_source)
        else
            print(r.msg)
        end
    end)
end

function m:search(key)

    http:request('/api/cw_package/search', { form = { package_name = key } })._then(function(r)
        if -1 ~= tonumber(r.code) and r.data then
            if #r.data > 0 then
                for i, v in pairs(r.data) do
                    print(v.name, v.title, v.port, v.git_source, v.install_times, v.platform, v.remark)
                end
            end
        else
            print(r.msg)
        end
    end)
end

return m