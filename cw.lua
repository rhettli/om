-- cw mapper

-- cw == cwjit oshine/install cw
-- cw login== cwjit oshine/install cw login
-- cw install== cwjit oshine/install install

--SET Path=D:\phpStudy\;D:\phpStudy\apache\bin;D:\phpStudy\tools\composer;D:\phpStudy\PHPTutorial\php\php-7.2.1-nts;D:\phpStudy\mysql\bin;%Path%

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

    end,
    download = function(source)

    end
}