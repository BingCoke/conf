#! /bin/bash
# 电池电量

source ~/.profile

this=_bat
s2d_reset="^d^"
signal=$(echo "^s$this^" | sed 's/_//')
main() {
    bat=$(upower -e | grep BAT)
    bat_text=$(upower -i $bat | awk '/percentage/ {print $2}' | grep -Eo '[0-9]+')
    charge_icon=" "
     [ -z "$(acpi -a | grep on-line)" ] && charge_icon=" "
      if   [ "$bat_text" -ge 95 ]; then bat_icon=""; 
      elif [ "$bat_text" -ge 90 ]; then bat_icon="";
      elif [ "$bat_text" -ge 80 ]; then bat_icon="";
      elif [ "$bat_text" -ge 70 ]; then bat_icon="";
      elif [ "$bat_text" -ge 60 ]; then bat_icon="";
      elif [ "$bat_text" -ge 50 ]; then bat_icon="";
      elif [ "$bat_text" -ge 40 ]; then bat_icon="";
      elif [ "$bat_text" -ge 30 ]; then bat_icon="";
      elif [ "$bat_text" -ge 20 ]; then bat_icon="";
      elif [ "$bat_text" -ge 10 ]; then bat_icon="";
      else bat_icon=""; fi

    bat_text=$bat_text%
    bat_icon=$charge_icon$bat_icon
    

    text=" $bat_icon $bat_text"
    echo $text
    sed -i '/^export '$this'=.*$/d' $DWM/statusbar/temp
    printf "export %s='%s%s%s%s'\n" $this "$signal" "$color" "$text |" "$s2d_reset" >> $DWM/statusbar/temp
}

main
