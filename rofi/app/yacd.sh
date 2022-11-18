#! /bin/bash
#docker yack start&stop

has=$(docker ps|grep yacd)
if [ ! -n "$has" ];then
        notify-send "open yacd" -t 5000
    docker start yacd  > /dev/null 2>&1
else 
        notify-send "close yacd" -t 5000
    coproc(docker stop yacd  > /dev/null 2>&1)
fi