#! /bin/bash
# VOL 音量脚本

source ~/.profile

this=_vol
s2d_reset="^d^"
#color="^c#0e0815^^b#148F77^"
# color="^c#0e0815^^b#53727d^"
color="^c#bbbbbb^^b#222222^"
#$(amixer get Master | awk -F "[][]" '/Left:/ {print $2}' |sed 's/.$//g')
main() {
    sink=$(pactl info | grep 'Default Sink' | awk '{print $3}')
    volunmuted=$(amixer get Master | grep on)
    vol_text=$(amixer get Master | awk -F "[][]" '/Left:/ {print $2}' |sed 's/.$//g')
    if [ "$vol_text" -eq 0 ] || [ ! "$volunmuted" ]; then vol_text="--"; vol_icon="婢";
    elif [ "$vol_text" -lt 10 ]; then vol_icon="奄"; vol_text=0$vol_text;
    elif [ "$vol_text" -le 20 ]; then vol_icon="奄";
    elif [ "$vol_text" -le 60 ]; then vol_icon="奔";
    else vol_icon="墳"; fi

    vol_text=$vol_text%

    text=" $vol_icon $vol_text "
    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    printf "export %s='%s%s%s'\n" $this "$color" "$text|" "$s2d_reset" >> $DWM/statusbar/temp
}

main
