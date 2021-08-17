# woo:om 包管理器(开发中，目前暂不可用)

**[[english]](https://gitee.com/oshine/om/blob/master/README.md)**

#### 介绍 
```
1.om 可以帮你管理所有的cw包，已经创建新的cwm包
2.om 可创建替代unix系统的命令行工具
3.om 可以收藏您喜欢的文件图片文字等
4.om 可以把您喜欢的文件分享给朋友
5.om 提供了一个网盘，默认1G空间
```

#### 【安装教程】
[请注意]：
`安装om之前必须先安装woo语言`

# **1.为Windows安装om** 
## 如果你是win10 或安装了powershell,可以在powershell中使用woo语言来安装om
>(支持在cmd和git bash中使用此脚本来安装om)
安装前请确认woo.exe可执行文件已加入环境变量，否则请使用绝对路径
```
woo.exe -r "print(woo.http:new():get('https://wooyri.com/s/om?v=latest').body)" | woo.exe -r
```

# **2.为 drawin(mac) 和 linux 系统安装om** 
```shell
woo.exe -r "print(woo.http:new():get('https://wooyri.com/s/om?v=latest').body)" | woo.exe -r
# 或者
curl -fsSl https://wooyri.com/s/om?v=latest | woo -r
```

#  **3.新建om包并且提交供他人安装** 
**om包新建包命令**
`om create package_name`

#### 1.如果你的包是供他人安装，那么package.lua中的require可以忽略，如果不可用作为资源包供他人代码引用，那么必须把 require设置为false 或 0
```lua
--author: liyanxi

return {
    -- 包的名称 oshine用户名，Murphy包名，中间用/符号分割
    package_name = 'oshine/Murphy',

    -- 当前包所需的依赖包，*表示最高版本，也可以使用1.2*表示1.2内的所有版本均可，|符号后面可以加local和global表示包安装在本地包中的vendor路径，还是全局共享路径,download表示仅仅下载
    dependencies = {
        ['oshine/cw_device'] = '?',
        ['oshine/cw_any_type'] = '?|local',
         ['oshine/***'] = '1.?|download',
        ['oshine/cw_args_capture'] = '1.2?|global',
    },

    --- 包 所支持的平台，all表示所有平台，不写默认all，多个平台中间用空格隔开
    platform = 'all' or 'windows drawn linux',
    --- 支持的cpu架构:amd64 arm64 arm32 ...,如果是纯woo脚本这里填写all
    arch ='all',

    -- 这个包需要注册的端口，注册端口仅仅用于他人参考，防止包与包之间端口重复
    -- port = '8008',

    -- 包的备注简介
    remark='for dev web app',
    -- 包的标题名称，可供他人搜索使用，和查看
    title='Coder Wooyri official web framework',

    -- 表示作为资源包供他人代码引用，0/false表示作为框架供下载安装，默认为true
    self_install=true
}
```
#### 2.提交git包到服务器，供他人搜索安装

```
# 命令格式cwm package add 包名称 git资源，多个git资源请用逗号分隔,例如：
cwm package add oshine/cw_cwm github.com/rhettli/cwm,gitee.com/oshine/cwm
```
#### 3.搜索他人他提交的安装包

```
# 命令格式cwm package search 包名称[包名称中有/符号，那么/符号前面的是用户名],例如：
cwm package search oshine/cw_cwm
cwm package search cw_cwm
```


#### 4.join【参与贡献】

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request
