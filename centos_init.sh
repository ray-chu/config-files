#!/bin/bash
# Initial configuration script for CentOS or RHEL system after system deploying
# Please run it as root or sudoers
#
# History:
# Feb/19/2014 Xian Zhu 
#Version 1 

#Test software management command
# if [ "$(which yum)" ]
# then
#     MGM_CMD=yum
# elif [ "$(which apt-get)" ]
# then
#     MGM_CMD=apt-get
# else
#     echo "Cannot find software management command"
#     exit 0
# fi

#First check all requird softwares
if [ ! -s installed_list ]
then
    yum list installed > installed_list
fi

if [ ! "$(grep 'emacs' installed_list)" ]
then
    NEED_INSTALL_LIST=$NEED_INSTALL_LIST+" emacs"
fi

if [ $NEED_INSTALL_LIST ]
then
    yum -y install $NEED_INSTALL_LIST
fi