#!/usr/bin/env bash

if [! -f "~/cw/bin/cw" ]; then
    echo 'cw not exists'
    mkdir -p ~/cw/bin && sudo  curl http://oilcn.cn-sh2.ufileos.com//t/cw -o ~/cw/bin/cw ;
    sudo chmod a+x ~/cw/bin/cw ;
    else
    echo 'cw exists'
fi

result=$(cat ~/.bash_profile | grep "~/cw/bin/:")
if [[ "$result" != "" ]]; then
    echo "already in env"
else
    echo 'export PATH=~/cw/bin/:$PATH \n' >> ~/.bash_profile
    echo 'export CW_PATH=~/cw/ \n' >> ~/.bash_profile
    source ~/.bash_profile
fi

result=$(cw -v|grep 'Coder Wooyri')
if [[ "$result" != "" ]]; then
    echo "install cw language success"
else
    exit
fi

# install cwm
#read -p "Enter some information > " name

if [[ "$CWM_PATH" != "" ]]; then
    echo 'cwm already installed'
    result=$(cwm -v|grep 'Coder Wooyri')
    if [[ "$result" != "" ]]; then
        echo "install cw language success"
        exit
    fi
fi

# start install
if [[ "$CWM_PATH" == "" ]]; then
    echo 'export CWM_PATH=~/cwm/ \n' >> ~/.bash_profile
fi

source ~/.bash_profile
mkdir -p ~/cwm
curl https://gitee.com/oshine/cwm/repository/archive/master.zip  -o $CWM_PATH/cwm.zip
cd $CWM_PATH && unzip cwm.zip

sudo chmod a+x cwm/bin/cwm.sh

result=$(cat ~/.bash_profile | grep "~/cwm/cwm/bin/:")
if [[ "$result" != "" ]]; then
    echo "already in env"
else
    echo 'export PATH=~/cwm/cwm/bin/:$PATH \n' >> ~/.bash_profile
    source ~/.bash_profile
fi

cd cwm && cwm i


