-- plugs core lib

local class_plugs = {}

function class_plugs:new  (lib_name)
    if not self._http then
        self._http = require('http')
        --print(self._http:new())
    end

    self._lib_name = lib_name

    -- when init plugs,check plugs if is running
    self._port = 0

    res, error_message = self._http.request("GET", 'http://127.0.0.1:' .. self._port .. '?op=ping', {})
    if error_message then
        print(error_message)
    else
        print(res['status_code'])
        print('Plugs ping reply:==', res.body)
    end

    return self
end

function class_plugs:load  (lib_name)
    -- load another plugs
    return self:new(lib_name)
end

function class_plugs:call   (...)
    -- use http request to call plugs function

    self._http:post('http://127.0.0.1:' .. self._port..'/call', {
        body = json_encode(...),
        cookies = {},
        headers = {},
    })
end

return class_plugs