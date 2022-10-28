#! /bin/sh

sshx(){
    coproc ( st -c float -e ssh root@$1 > /dev/null  2>&1)
    exit 0
}

moshx(){
    coproc ( st -c float  -e mosh -p $2 root@$1 > /dev/null  2>&1)
    exit 0
}

case "$*" in
"")
echo "Hong"
echo "Shen"
echo "Guang"
echo "Sea"
echo "Chi"
;;
"Hong")
sshx $*
exit 0
;;
"Shen")
sshx $*
exit 0
;;
"Guang")
sshx Guang 
exit 0
;;
"Sea")
moshx Sea 60001
exit 0
;;
"Chi")
moshx Chi 60001
exit 0
;;
"")
esac

