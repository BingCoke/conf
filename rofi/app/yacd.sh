#! /bin/bash
#docker yack start&stop

has=$(docker ps|grep yacd)
if [  -n "$has" ];then
    #echo "not null"
    docker start yacd  > /dev/null 2>&1
else 
    #echo "null"
    coproc(docker stop yacd  > /dev/null 2>&1)
fi