#! /bin/sh

ssh_role(){
    coproc ( st -c float -e ssh $1@$2 > /dev/null  2>&1)
}


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
echo "other-arch"
;;
"other-arch")
  ssh_role bk 192.168.43.48
  exit 0;
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

