-- storage for package to save data easy and fast

local class_storage = {}

--- @param package_name string|nil
--- @param prefix string|nil
function class_storage:new(package_name, prefix)
    assert(package_name, 'package_name can not be nil')
    -- storage prefix with key/存储前缀
    self._prefix = prefix or ''
    -- install storage dir/存储目录
    local conf = require('oshine.conf')

    self._res = nil
    self._lan = conf.language
    assert(_in_array(self._lan, { 'en', 'zh' }), 'language must be en[english] or zh[中文] at conf file:' .. conf.install_dir ..
            '/conf/conf.cw' .. ' | 语言只能英文或中文在配置文件' .. conf.install_dir .. '/conf/conf.cw')

    self._dir = conf.install_dir .. '/storage' .. '/' .. package_name .. '/'
    if not _file_exists(self._dir) then
        assert(_mkdir(self._dir), ({ ['zh'] = '创建文件夹失败，请确认您是否有权限在目录：', ['en'] = 'create folder error,make sure you have permission at:' })[self._lan] .. self._dir)
    end

    return self
end

--- @param key string       key to save data
--- @param val string       value must be string
--- @param expire number    timestamp
function class_storage:put(key, val, expire)
    -- put something to disk with  prefix..projectname..key
    local err
    self._res, err = _file_put_contents(self._dir .. key, (expire and expire or '') .. '\n' .. val)

    return self._res, err
end

function class_storage:result()
    return self._res
end

function class_storage:get(key)
    local err
    self._res, err = _file_get_contents(self._dir .. '/' .. key)
    if err then
        return '', err
    end
    local _13 = _str_index(self._res, '\n')
    if _13 > -1 then
        local time = _str_sub(self._res, _13, _13)
        if time < _time() then
            self._res = _str_sub(self._res, _13, nil)
            return self._res
        end
    end

    return '', err
end

--- @param key string|nil  if key is nil,clear all data about package
function class_storage:clear(key)
    -- todo ignore res?
    _delete(self._dir .. (key and key or ''))
    return true
end

return class_storage
