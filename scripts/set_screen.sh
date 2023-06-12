#! /bin/bash
:<<!
  设置屏幕分辨率的脚本(xrandr命令的封装)
  one: 只展示一个内置屏幕 2560x1600 缩放为 1440x900
  two: 左边展示外接屏幕 - 右边展示内置屏幕 都用匹配1080p屏幕DPI的缩放比
  check: 检测显示器连接状态是否变化 变化则自动调整输出情况
!

# 定义内置屏幕接口和外接屏幕接口
INNER_PORT=eDP-1
OUTPORT1=HDMI-1
OUTPORT2=DP-2

two() {
    # 查找已连接、未连接的外接接口
    OUTPORT_CONNECTED=$(xrandr | grep -v $INNER_PORT | grep -w 'connected' | awk '{print $1}')
    OUTPORT_DISCONNECTED=$(xrandr | grep -v $INNER_PORT | grep -w 'disconnected' | awk '{print $1}')
    # [ ! "$OUTPORT_CONNECTED" ] && one && return # 如果没有外接屏幕则直接调用one函数

    mm=""
    echo $mm
    if [[ -n "$mm" ]]; then 
      echo "not empty"
    else 
      echo "empty"
    fi
    if [[ -n "$OUTPORT_CONNECTED" ]]; then 
      # xrandr --output $INNER_PORT --primary --mode 2048x1152 --pos 1920x0 --scale 1x1 \
      #        --left-of --output $OUTPORT_CONNECTED --mode 1920x1080 --pos 0x0 --scale 1x1 --primary \
      #        --output $OUTPORT_DISCONNECTED --off
      xrandr --output eDP-1 --mode 2048x1152 --pos 0x51 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --pos 2048x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off
      # 动效
      # 背景图
      feh --bg-fill --randomize ~/tools/wallpaper/*.png
      #$HOME/.config/conky/conky.sh
    else 
      one
    fi


}
one() {
    xrandr --output $INNER_PORT --mode 2048x1152 --pos 0x0 --scale 1x1 --primary \
           --output $OUTPORT1 --off \
           --output $OUTPORT2 --off
    # 背景图
    feh --bg-fill --randomize ~/tools/wallpaper/*.png
    #$HOME/.config/conky/conky.sh
    xrandr --output eDP-1 --primary --mode 2048x1152 --pos 1920x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off
    return 1
}
check() {
    CONNECTED_PORTS=$(xrandr | grep -w 'connected' | awk '{print $1}' | wc -l)
    CONNECTED_MONITORS=$(xrandr --listmonitors | sed 1d | awk '{print $4}' | wc -l)
    [ $CONNECTED_PORTS -gt $CONNECTED_MONITORS ] && notify-send "use two because gt" && two # 如果当前连接接口多于当前输出屏幕 则调用two
    [ $CONNECTED_PORTS -lt $CONNECTED_MONITORS ] && notify-send "use one because lt" && one # 如果当前连接接口少于当前输出屏幕 则调用one
}



case $1 in
    one) one ;;
    two) two ;;
    check) check ;;
    *) check ;;
esac
