mountx(){
        #coproc ( st -c float -e ssh root@$1 > /dev/null  2>&1)
    if [  -n "$(ls ~/remote/ | grep "$1")" ] && [  -n "$(ls ~/remote/$1/)" ] ;then
        #echo "not null"
        umount ~/remote/$1
        rmdir ~/remote/$1
    else 
        #echo "null"
        mkdir -p ~/remote/$1 > /dev/null  2>&1
        coproc(sshfs -p 22 root@$1:/ ~/remote/$1 > /dev/null  2>&1)
    fi
}
echo -en "\0prompt\x1fmount\n"
echo -en "\0data\x1fmount\n"
case "$*" in
"")
echo "Shen"
echo "Hong"
echo "Guang"
echo "Sea"
echo "Chi"
;;
*)
mountx $*
exit 0
;;
esac


