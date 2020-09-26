local format = {}

function format:new()
    self._header = {}
    self._footer = {}
    self._size = {}
    self._body = {}
    return self
end

function format:header(header)
    self._header = header
end

function format:footer(footer)
    self._footer = footer
end

function format:body(body)
    self._body[#self._body + 1] = body
end

function format:print()
    for o = 1, #self._header do
        local l = 0
        local l_incr = 1
        for i, v in pairs(self._body) do
            --print(l, len(v[o]), v[o])
            if l < len(v[o]) then

                l = len(v[o])

                local r = re_match(v[o], '[一-龥]')

                local left_index = 0
                if r and #r > 0 then
                    --print('---------', k, json_encode(r))
                    l_incr = #r
                end
                --print(l, v[o], #v[o], len(v[o]), #r, l)
            end
        end
        self._size[o] = l + l_incr * 1.4
        if o ~= #self._header then
            self._size[o] = l + 5
        end
    end
    --print(json_encode(self._size))

    local str = ''
    for i, v in pairs(self._header) do
        str = str .. v
        for p = 1, self._size[i] - #v do
            str = str .. ' '
        end
    end
    str = str .. '\n'
    for i, v in pairs(self._body) do
        for j, k in pairs(v) do
            str = str .. k
            local r = re_match(k, '[一-龥]')

            local left_index = 0
            if r and #r > 0 then
                --print(#r,json_encode(r))
                left_index = #r * 0.666
            end

            for p = 1, self._size[j] - len(k) - left_index do
                str = str .. ' '
            end
        end
        str = str .. '\n'
    end

    for i, v in pairs(self._size) do
        for p = 1, v do
            str = str .. '-'
        end
    end
    str = str .. '\n'

    for i, v in pairs(self._footer) do
        str = str .. v
        for p = 1, self._size[i] - len(v) do
            str = str .. ' '
        end
    end

    str = str .. '\n'

    return str
end

local f = format:new()

f:header({ 'Id', 'Name', 'Ud', 'Time' })
f:body({ '1', '4564781212', '1323', '1323' })
f:body({ '2', 'kjhiubnh', '458615485512', '1245' })
f:footer({ '', '', 'Total', '12$' })

print(f:print())


--local r = re_match('噶噶噶13', '[一-龥]')
--print('123:==', json_encode(r))

return format
