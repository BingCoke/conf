#! /bin/bash
# 获取键盘布局
source ~/.profile
this=_keyboard
s2d_reset="^d^"
color="^c#bbbbbb^^b#222222^"

main(){

    text="   $(setxkbmap -query | awk '/layout/{print $2}') "
    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    printf "export %s='%s%s%s'\n" $this "$color" "$text|" "$s2d_reset" >> $DWM/statusbar/temp
}


main