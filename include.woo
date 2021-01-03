local cls = {}

function cls:new()
    return self
end

function cls:include(...)
    local r1 = { ... }

    for _, v in pairs(r1) do

        local e, r = pcall(function(v)
            return require(v)
        end, v)

        --print(v, r, e)

        if  e then
            return r
        end
    end
    return nil
end

return cls