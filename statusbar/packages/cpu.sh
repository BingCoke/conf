#! /bin/bash
# CPU 获取CPU使用率和温度的脚本

source ~/.profile

this=_cpu
s2d_reset="^d^"
color="^c#bbbbbb^^b#222222^"

main() {
    cpu_icon="閭"
    cpu_text=$(top -n 1 -b | sed -n '3p' | awk '{printf "%02d%", 100 - $8}')
    temp_text=$(sensors | grep Tctl | awk '{printf "%d°C", $2}')  

    text=" $cpu_icon $cpu_text $temp_text"
    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    printf "export %s='%s%s%s'\n" $this "$color" "$text|" "$s2d_reset" >> $DWM/statusbar/temp
}

main
