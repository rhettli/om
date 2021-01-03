-- Author:liyanxi liyanxi_rhett@[outlook/126/foxmail/icloud/wooyri].com

-- Todo ,read trs.cw form /conf/trs.cw
local m = { host = 'http://127.0.0.1:8008' }

function m:new()
    self._http = require('http')
    return self
end

function m:request(path, params)
    if type(params.form) == 'table' then
        local form = params.form
        params.form = ''
        for i, v in pairs(form) do
            params.form = params.form .. i .. '=' .. v .. '&'
        end
    end

    local sid = file_get_contents(require('oshine.cwm.conf').install_dir .. 'sid') or ''

    params.form = params.form .. 'sid=' .. sid

    print('params.form:===',  params.form)

    local r, e = self._http.request('POST', self.host .. path, params)

    print(r.body)

    return {
        _then = function(f)
            if e then
                assert(false, e)
            else
                if r['status_code'] == 200 then
                    if str_index(r['headers']['Content-Type'], '/json') > -1 then
                        f(json_decode(r.body))
                    else
                        f(r.body)
                    end

                end
            end
        end
    }
end

return m
