local dir = _DIR
local work_dir = ''
local yml = nil
local os = os()

local class_installer = {}

function class_installer:new (work_dir_)
    work_dir = work_dir_

    if not file_exist(work_dir_ .. '/package.yml') then
        out('package.yml lose,this not a correct package')
        return false
    end

    print('start parse:', work_dir_ .. '/package.yml')
    yml, err = yml_parse(work_dir_ .. '/package.yml')
    if err then
        print('parse fail,check syntax:', err)
        return
    end

    print(json_encode({ l = 123, gg = 12 }))
    print("package parse done:==", json_encode(yml))

    if not yml.name then
        assert(false, 'no package [name] in package.yml,it is not a correct package.')
    end

    print('current os:', os)
    print('package support platform :', yml.platform or 'mac windows linux')
    -- check platform
    if not yml.platform or yml.platform == 'all' then
        return self
    end

    for _, v in pairs(str_split(yml.platform, " ")) do
        if trim(v) == os then
            return self
        end
    end

    assert(false, 'not support your os:' .. os)
end

function class_installer:yml_conf  ()
    return yml
end

function class_installer:is_installed  ()
    local ini = require('ini'):new()
    local ok = ini.open(install_ini)
    if not ok then
        out(false, 'can not open ini file,new one.')
        return false
    end

    if ini:key('installed', yml.package_name) == yml.package_name then
        out('package:' .. yml.package_name .. ' already installed,', 'you can use -r to reinstall this package.')
        return true
    end
end

function class_installer:download  (source)

end

function class_installer:install_plugs  ()
    -- check package.yml

    print('copy start...')
    -- before install
    print(pcall(function()
        local before = require('install.before')
        if before then
            before.run()
        end
    end))

    local r, e = copy(work_dir, install_dir .. '/' .. yml.name)
    print("copy:===", work_dir, install_dir .. '/' .. yml.name, r, e)
    -- before install
    pcall(function()
        local after = require(yml.name .. '.install.after')
        if after then
            after.run()
        end
    end)
    -- map cmd
    local callback = function(file, is_dir)
        print('file callback:===', file, is_dir)
        if str_index(file, '.lua') == #file - #'.lua' then
            if not is_dir then
                local real_file = str_split(str_replace(file, '\\', '/'), '/')
                local name = str_split(real_file[#real_file], '.')[1]
                local origin_name=name
                if os == 'windows' then
                    -- windows mcd
                    if str_index(file, 'windows') > -1 then
                        name = 'windows.' .. name
                    end
                    -- cwm cmd oshine/bitmap check
                    file_put_contents(install_dir .. '/bin/' .. origin_name .. '.cmd', '@echo off \n::Generate by cwm ,do not modify this file \n' ..
                            'cwm cmd ' .. yml.name .. ' ' .. name)
                elseif os == 'linux' or os == 'drawin' then
                    -- linux and mac cmd
                    if str_index(file, 'linux') > -1 then
                        name = 'linux.' .. name
                    elseif str_index(file, 'drawin') > -1 then
                        name = 'drawin.' .. name
                    end
                    file_put_contents(install_dir .. '/bin/' .. origin_name .. '.sh', '#Generate by cwm ,do not modify this file \n' ..
                            'cwm cmd ' .. yml.name .. ' ' .. name)
                end
            end
        end
    end

    file_in_folder(install_dir .. '/' .. yml.name .. '/cmd/', callback)

end

function class_installer:install(dir)

end

return class_installer