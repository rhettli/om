-- storage for package to save data easy and fast

local class_storage = {}

---@param prefix string|nil
function class_storage:new  (prefix)
    self.prefix = prefix or ''
    self.dir = require('oshine.conf').install_dir
    return self
end

function class_storage:put  (lib_name)
    -- load another plugs
    return self:new(lib_name)
end

function class_storage:get   (...)
    -- use http request to call plugs function

end

function class_storage:clear   (...)
    -- use http request to call plugs function

end

return class_storage
