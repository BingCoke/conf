#! /bin/bash
fastlink="https://apiv2.lipulai.com/api_version2/o20a2cghdvndhnyk?clash=1&log-level=info"
feiniao="http://47.243.242.204:25500/sub?target=clash&url=https%3A%2F%2Ffeiniaoyun.top%2Fapi%2Fv1%2Fclient%2Fsubscribe%3Ftoken%3D97e75324f0b87e0a5e48b668f2319084&insert=false&emoji=true&list=false&tfo=false&scv=false&fdn=false&sort=false&new_name=true"
cherry="https://api1.cherrylink.me/sub?target=clash&url=https://cherryvpn.net/link/TQCcLOCsuhz3VrmW?sub=2&insert=false&config=https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online.ini"
OK="https://api.surfhub.net/link/U8tCLKT5cacg68po?clash=1"
downloadClash(){
    #rm -rf /home/bk/conf/clash/conf/*
    axel  -o /home/bk/conf/clash/conf/fastlink-tmp.yaml $fastlink
    axel -N -o /home/bk/conf/clash/conf/feiniao-tmp.yaml $feiniao
    wget -O /home/bk/conf/clash/conf/cherry-tmp.yaml $cherry
    axel  -o /home/bk/conf/clash/conf/OK-tmp.yaml $OK
    mv /home/bk/conf/clash/conf/fastlink-tmp.yaml /home/bk/conf/clash/conf/fastlink.yaml
    mv /home/bk/conf/clash/conf/cherry-tmp.yaml /home/bk/conf/clash/conf/cherry.yaml
    mv /home/bk/conf/clash/conf/feiniao-tmp.yaml /home/bk/conf/clash/conf/feiniao.yaml
    mv /home/bk/conf/clash/conf/OK-tmp.yaml /home/bk/conf/clash/conf/OK.yaml
    rm -rf /home/bk/conf/clash/conf/feiniao-tmp.yaml /home/bk/conf/clash/conf/fastlink-tmp.yaml  /home/bk/conf/clash/conf/OK-tmp.yaml /home/bk/conf/clash/conf/cherry-tmp.yaml
    source $myconf/rofi/app/temp
    cp /home/bk/conf/clash/conf/$clashx.yaml /home/bk/conf/clash/config.yaml
    http  --ignore-stdin PUT :9090/configs force==false path=/home/bk/conf/clash/config.yaml
}


cron(){
    while true; do downloadClash;  sleep 3600;   done &
}

case "$1" in
"main")
    cron
;;
"flush")
   coproc( downloadClash  > /dev/null  2>&1)
;;
"test")
    downloadClash
;;
esac

