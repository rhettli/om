# om:woo language package manager

**[[中文]](https://gitee.com/oshine/cwm/blob/master/README_zh.md)**

#### Attention
```
1.cwm help you manager you cw language package and create new package
2.cwm create cmdline run on windows like some cmd run on unix
3.cwm can add some file/picture/string to favorite
4.cwm can share the file to your friend
5.cwm support a net disk, default 1 Gb 
```

#### install【安装教程】
Attention[请注意]：
`before install om ,you must install woo laguage`

# **1.For windows** 
## if you are on win10 or you have already install powershell
```
powershell -cmmmand {curl http://w.installer.lua -o _.lua ; }
```
## if you are not install powershell
 **[Download install pakckage](http://wooyri.com/om/cownload)** 


# **2.For drawin(mac) and linux** 
```
powershell -cmmmand {curl http://w.installer.lua -o _.lua ; }
```

# 3.how to create om package
`om new package cw_package_name`
```lua
return {
    -- oshine is username of wooyri accout id
    -- c_rename is package_name
    ['package_name'] = "oshine/cw_rename",
    -- you can use all to support all platform or [windows linux] only windows and linux
    -- or [all !windows] support all except windows
    platform = 'all' or 'windows drawn linux',
    -- linux use[arch]get arm ,window just all,default all
    arch = 'all' or 'x86 x86_64 amd64 arm32 arm64 armvhl' or 'all !armhf !armel',

    -- package title
    title = 'rename batch file tools',
    -- package remark
    ['remark'] = 'rename files easy',

    -- export a global cmd map from cmd folder:/cmd/256.cw map with global name rename,
    -- /cmd/finder.cw map with global cmd name finder
    ['export'] = 'rename=256 finder=finder'
}
```

#### join

1.  Fork 
2.  create Feat_xxx 
3.  submit code
4.  create pull request