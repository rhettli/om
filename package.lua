--author: liyanxi

return {
    -- oshine is member name ,cwm is package name
    package_name = 'oshine/cwm',
    -- where should this package install,[default:local]
    self_install = 'global',
    -- local:install dependecies install vendor folder
    -- or global:install dependencies install global dir
    -- [default:local]
    dependencies_install = 'global',
    -- ['package_name'] = 'version'
    -- version must like :* , 1.*, 2.3.*
    dependencies = {
        ['oshine/cw_any_type'] = '*',
        ['oshine/cw_args_capture'] = '*'
    },
    -- platform default is all platform
    platform = 'all' or 'windows drawn linux',
    -- which port will take,mulit port use , split

    --port = '12225,12224',

    remark='install package in any platform at any time',
    title='Coder Wooyri package manager',
}







