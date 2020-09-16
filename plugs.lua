-- plugs core lib

local class_plugs = {}

-- lib_name [example:oshine.bitmap]
function class_plugs:new  (lib_name)
    assert(lib_name, 'lib name empty')

    if not self._http then
        self._http = require('http')
        --print(self._http:new())
    end

    local conf = require('oshine.cwm.conf')

    self._lib_name = lib_name

    local current_dir = conf.install_dir .. str_replace(lib_name, '.', '/')
    print('want load lib:==', current_dir)

    self.plugs_yml = yml_parse(current_dir .. '/package.yml')
    print("plugs port:", self.plugs_yml.port)

    require(lib_name .. '.init'):new(self.plugs_yml, current_dir)

    -- when init plugs,check plugs if is running
    self._port = self.plugs_yml.port

    local res, error_message = self._http.request("GET", 'http://127.0.0.1:' .. self._port .. '/ping', {})
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

    local result, error_message = self._http.request("POST", 'http://127.0.0.1:' .. self._port .. '/call', {
        body = json_encode({ ... }),
        headers = { op = 123 }
    })

    if error_message then
        return nil, 'Call plugs func got err:' .. error_message
    else
        if result['status_code'] == 200 then
            local res = json_decode(result.body)
            if res.code == 0 then
                return res.data
            else
                return res.data, res.msg
            end
        else
            return nil, 'Plugs return status not 200'
        end
    end
end

return class_plugs