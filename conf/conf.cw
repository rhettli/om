-- config model


local dir = _home() .. '/cwm/'
return {
    STORAGE_dir = dir .. '/storage', -- cwm install dir / cwm 安装目录
    install_dir = dir, -- cwm install dir / cwm 安装目录
    language = 'en', -- en [english] or zh [中文]
    start_plugs = 'auto',
    api_host = 'http://127.0.0.1:8008'
}
