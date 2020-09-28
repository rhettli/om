# cwm:cw 包管理器

**[[english]](https://gitee.com/oshine/cwm/blob/master/README.md)**

遇到一个瓶颈【如何通过http请求方式知道git中包含的版本】：知道的小伙伴告知下，谢谢！

#### 介绍 
```
1.cwm 可以帮你管理所有的cw包，已经创建新的cwm包
2.cwm 可创建替代unix系统的命令行工具
3.cwm 可以收藏您喜欢的文件图片文字等
4.cwm 可以把您喜欢的文件分享给朋友
5.cwm 提供了一个网盘，默认1G空间
```

#### 【安装教程】
[请注意]：
`安装cwm之前必须先安装cw语言`

# **1.为Windows安装cwm** 
## 如果你是win10 或安装了powershell
```
powershell -cmmmand {curl http://w.installer.lua -o _.lua ;cw _.lua; }
```
## 如果你没有安装poowershell 
 **[【下载安装包】](http://wooyri.com/cw/cownload)** 


# **2.为 drawin(mac) 和 linux 系统安装cwm** 
```
sh -c curl http://w.installer.lua -o _.lua && cw _.lua; 
```

#  **3.新建cwm包并且提交供他人安装** 
**cwm包新建包命令**
`cwm create package_name`

#### 1.如果你的包是供他人安装，那么package.lua中的require可以忽略，如果不可用作为资源包供他人代码引用，那么必须把 require设置为false 或 0
```lua
--author: liyanxi

return {
    -- 包的名称 oshine用户名，Murphy包名，中间用/符号分割
    package_name = 'oshine/Murphy',

    -- 当前包所需的依赖包，*表示最高版本，也可以使用1.2*表示1.2内的所有版本均可，|符号后面可以加local和global表示包安装在本地包中的vendor路径，还是全局共享路径
    dependencies = {
        ['oshine/cw_device'] = '*',
        ['oshine/cw_any_type'] = '*|local',
        ['oshine/cw_args_capture'] = '*|global'
    },

    -- 包 所支持的平台，all表示所有平台，不写默认all，多个平台中间用空格隔开
    platform = 'all' or 'windows drawn linux',

    -- 这个包需要注册的端口，注册端口仅仅用于他人参考，防止包与包之间端口重复
    port = '8008',

    -- 包的备注简介
    remark='for dev web app',
    -- 包的标题名称，可供他人搜索使用，和查看
    title='Coder Wooyri official web framework',

    -- require 1/true表示作为资源包供他人代码引用，0/false表示作为框架供下载安装，默认为true
    require=true
}
```
#### 2.提交git包到服务器，供他人搜索安装

```
# 命令格式cwm package add 包名称 git资源，多个git资源请用逗号分隔
cwm package add oshine/cw_cwm github.com/rhettli/cwm,gitee.com/oshine/cwm
```
#### 3.搜索他人他提交的安装包

```
# 命令格式cwm package search 包名称[包名称中有/符号，那么/符号前面的是用户名]
cwm package search oshine/cw_cwm
cwm package search cw_cwm
```


#### join【参与贡献】

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request
