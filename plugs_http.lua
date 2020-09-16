-- plugs core lib

local class_http = {}

function class_http:new  (port)
    if not self._http then
        self._http = require('http')
        --print(self._http:new())
    end
    self._port = port
    return self
end

function class_plugs:init  (lib_name)
    self._plugs = require(lib_name .. '.init')
    self._plugs.run(self.plugs_yml, current_dir)
end

function class_http:result   (cookies)
    return self.data, self.msg
end
function class_http:cookies   (cookies)
    self._cookies = cookies
end
function class_http:headers   (headers)
    self._headers = headers
end

-- this is post method
function class_http:request   (...)
    -- use http request to call plugs function
    local result, error_message = self._http.request("POST", 'http://127.0.0.1:' .. self._port .. '/call', {
        body = json_encode({ ... }),
        headers = self._headers, -- { op = 123 }
        _cookies = self._cookies -- { op = 123 }
    })

    if error_message then
        self.data, self.msg = nil, 'Call plugs func got err:' .. error_message
    else
        if result['status_code'] == 200 then
            local res = json_decode(result.body)
            if res.code == 0 then
                self.data, self.msg = res.data, nil
            else
                self.data, self.msg = res.data, res.msg
            end
        else
            self.data, self.msg = nil, 'Plugs return status not 200'
        end
    end

    return self
end

return class_http