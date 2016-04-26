#!/bin/bash
###############################################################################
#  @programe  : DNS UPDATE
#  @writer    : Morphy Hu                                          
#  @date      : 2013-8-29
###############################################################################
#Define PATH ENV
PATH=/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export PATH
export LANG="zh_CN.UTF-8"
LYNX=/usr/bin/lynx
#Define DNS相关参数
#定义日志文件
DATE=`date +'%Y-%m-%d %H:%M:%S'`
LOG_DIR=/etc/sh
#如果目录不存在，则创建
if [ ! -d $LOG_DIR ];then
    mkdir -p $LOG_DIR
fi
LOG_DATE=`date +%Y%m`
LOG_FILE=$LOG_DIR/$LOG_DATE\_DNSUPDATE.LOG
#UPDATE DDNS
echo "-------------------------------------$DATE START-------------------------------------"  >> $LOG_FILE 
curl "http://www.cn.5ykd.com/?u=huogou01&p=passwd"
curl "http://ip.vivaf.com/?u=huogou01&p=passwd"
/usr/bin/perl /usr/local/gdipc/bin/gdipc.pl >> $LOG_FILE  2>&1
echo "-------------------------------------$DATE DONE--------------------------------------"  >> $LOG_FILE 
echo ""  >> $LOG_FILE  
