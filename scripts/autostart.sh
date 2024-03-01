#! /bin/bash
source ~/.profile

# 设置状态烂
$DWM/statusbar/statusbar.sh cron &
# 定时更新订阅
#
#
# changeBg() {
#   while true
#   do
#     sleep 1000
#     feh --bg-fill --randomize ~/tools/wallpaper/*.png
#   done
# }
#
# changeBg &
#glava -d &> /dev/null &

settings() {
    xset -b                                   # 关闭蜂鸣器
    syndaemon -i 1 -t -K -R -d                # 设置使用键盘时触控板短暂失效
    ~/tools/scripts/set_screen.sh two             # 设置显示器
}

daemons() {
  xfce4-power-manager &
  picom --config /home/bk/.config/picom-a.conf  --experimental-backends -b
  fcitx5 -d
  copyq &
#  clash &
  #clash-verge &
  sudo v2raya & 
}

cron() {
    sleep 5s
    while true; do
        ~/tools/scripts/set_screen.sh check               # 设置显示器
        sleep 5; 
    done
}

settings 1 &                                  # 初始化设置项
daemons 3 &                                   # 后台程序项
cron 10 &                                      # 定时任务项
