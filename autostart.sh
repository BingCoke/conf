#!/bin/bash

# 设置状态烂
$DWM/statusbar/statusbar.sh cron &

settings() {
    xset -b                                   # 关闭蜂鸣器
    syndaemon -i 1 -t -K -R -d                # 设置使用键盘时触控板短暂失效
    #~/mygithub/conf/scripts/set_screen.sh two             # 设置显示器
    xrandr --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output HDMI-0 --off --output DP-4 --off --output eDP-1-1 --mode 1680x1050 --pos 0x0 --rotate normal

    sudo mount /dev/sda1 /home/bk/data &
}

daemons() {
  xfce4-power-manager &
  picom -b
  #picom -b
  fcitx5 -d
  feh --bg-fill --randomize ~/mygithub/conf/wallpaper/*.png
  copyq &
  # clash-verge &
  #sudo v2raya &
  nekoray &
}

cron() {
    sleep 5s
    while true; do
        #~/mygithub/conf/scripts/set_screen.sh check               # 设置显示器
        sleep 5; 
    done
}

settings 1 &                                  # 初始化设置项
daemons 3 &                                   # 后台程序项
cron 10 &                                      # 定时任务项
