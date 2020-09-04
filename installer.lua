local install_ini = '~/cw_installer/cw_install/install.ini'
local install_dir = '~/cw_installer/cw_install/'
local dir = _DIR
local work_dir = ''
local yml = nil
local os = os()

return {
    dir = dir,
    os = os,
    install_dir = install_dir,
    init = function(work_dir_)
        work_dir = work_dir_

        if not file_exist(dir .. 'package.yml') then
            out('package.yml lose,this not a correct package')
            return false
        end
        yml = yml_parse(dir .. 'package.yml')
        if not yml.package_name then
            assert(false, 'no package_name in package.yml,it is not a correct package.')
        end

        for i, v in pairs(yml.platform) do
            if v == os then
                return
            end
        end
        assert(false, 'not support your os:' .. os)
    end,
    yml_conf = function()
        return yml
    end,
    is_installed = function()
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

    end,
    download = function(source)

    end
}