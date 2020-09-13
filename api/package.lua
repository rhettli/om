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

function m:_install(data)
    local install_where = env('CWM_PATH')
    print(json_encode(data))
    if not data[1] then
        return
    end
    local git_source = data[1].git_source
    local arr = str_index(git_source, ',')
    if arr > -1 then
        git_source = str_split(git_source, ',')
    else
        git_source = { git_source }
    end
    for i, v in pairs(git_source) do
        local download_path = install_where .. '/' .. data.name .. '.zip'
        local dr = download(v, download_path, function(r)
            print(r)
        end)
        if dr then
            un_compress(download_path)
        end
    end
end

function m:search(key, is_install)
    if is_install then
        if str_index(key, '/') < 1 then
            print('install a package ,must full path like:oshine/cw_device')
            return
        end
    end

    http:request('/api/cw_package/search', { form = { package_name = key } })._then(function(r)
        if -1 ~= tonumber(r.code) and r.data then
            if #r.data > 0 then
                -- install [安装]
                if is_install then
                    self:_install(r.data)
                    return
                end
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
