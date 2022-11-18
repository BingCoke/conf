#! /bin/sh
#printf "export %s='%s%s%s'\n" $this "$color" "$text|" "$s2d_reset" >> $DWM/statusbar/temp
fastlink=~/conf/clash/conf/fastlink.yaml
feiniao=~/conf/clash/conf/feiniao.yaml
echo -en "\0prompt\x1fclash\n"
echo -en "\0data\x1fclash\n"
this=clashx
clashx(){
    source $myconf/rofi/app/temp

    if [[ -n $clashx ]] | [[ "$clashx" != "$*" ]]; then
        notify-send "goto $*" -t 5000
        cp /home/bk/conf/clash/conf/$*.yaml /home/bk/conf/clash/config.yaml
        coproc(http  --ignore-stdin PUT :9090/configs force==false path=/home/bk/conf/clash/config.yaml > /dev/null  2>&1)
        sed -i '/^export '$this'=.*$/d' $myconf/rofi/app/temp
        printf "export %s=%s\n" $this "$*" >> $myconf/rofi/app/temp
    else
        notify-send "noting to do" -t 5000
    fi

}


case "$*" in
"")
echo "feiniao"
echo "fastlink"
;;
*)
clashx $*
exit 0
;;
esac



