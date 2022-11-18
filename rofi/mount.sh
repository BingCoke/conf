mountx() {
	#coproc ( st -c float -e ssh root@$1 > /dev/null  2>&1)
	if [ -n "$(ls ~/remote/ | grep "$1")" ] && [ -n "$(ls ~/remote/$1/)" ]; then
		notify-send " umount $1" -t 5000
		umount ~/remote/$1
		rmdir ~/remote/$1
	else
		notify-send " mount $1" -t 5000
		mkdir -p ~/remote/$1 >/dev/null 2>&1
		sshfs -p 22 root@$1:/ ~/remote/$1/
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
	coproc (mountx $* >/dev/null 2>&1)
	exit 0
	;;
esac
