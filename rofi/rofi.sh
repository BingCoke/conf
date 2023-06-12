#! /bin/sh
echo -en "\0prompt\x1fmenu\n"
echo -en "\0data\x1f\n"
menu=$ROFI_DATA

case "$menu" in
	"")
		case "$*" in
			"yacd")
				$myconf/rofi/app/yacd.sh
				exit 0
				;;
      "weather")
        $HOME/.config/conky/Zozma/scripts/weather.sh
        ;;
			"mount")
				$myconf/rofi/mount.sh
				;;
			"clash")
				$myconf/rofi/app/clash.sh
				;;
			"backgroud")
				feh --bg-fill --randomize ~/tools/wallpaper/*.png
				;;
			"flush-clash")
				/home/bk/scripts/autodonwload.sh flush
				notify-send "flush" -t 5000
				;;
			"modmap") 
				[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
				;;
			"ranger")
				coproc (st -c float -e ranger >/dev/null 2>&1)
				;;
      "screen-one")
        xrandr --output eDP-1 --mode 2048x1152 --rate 60 --output HDMI-1 --off
        picom --experimental-backends -b
        feh --bg-fill --randomize ~/tools/wallpaper/*.png
        $HOME/.config/conky/conky.sh
        ;;
      "screen-two")
        xrandr --output eDP-1 --primary --mode 2048x1152 --pos 1920x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off
        picom --experimental-backends -b
        feh --bg-fill --randomize ~/tools/wallpaper/*.png
        $HOME/.config/conky/conky.sh
        ;;
      "picom")
        picom --experimental-backends -b
        ;;
      "picom-kill")
        killall picom
        ;;
      "picom-flush")
          sed -i 's/backend = "glx"/#backend = "glx"/1' ~/.config/picom.conf
          sleep 0.2
          sed -i 's/#backend/backend/1' ~/.config/picom.conf
        ;;
      "picom animations open")
          sed -i 's/animations = false;/animations = true;/1' ~/.config/picom.conf
        ;;
      "picom animations close")
          sed -i 's/animations = true;/animations = false;/1' ~/.config/picom.conf
        ;;
      "picom fading open")
          sed -i 's/fading = false;/fading = true;/1' ~/.config/picom.conf
        ;;
      "picom fading close")
          sed -i 's/fading = true;/fading = false;/1' ~/.config/picom.conf
        ;;
      "touchpad")
        $myconf/rofi/app/touchpad_toggle.sh
        ;;
      "glava")
	        coproc (glava -d >/dev/null 2>&1)
        ;;
      "glava close")
        killall glava
        ;;
			"")
				echo "yacd"
        echo "weather"
        echo "glava"
        echo "glava close"
				echo "mount"
				echo "backgroud"
				echo "clash"
				echo "flush-clash"
				echo "modmap"
				echo "ranger"
        echo "screen-one"
        echo "screen-two"
        echo "picom"
        echo "picom-kill"
        echo "picom-flush"
        echo "picom animations open"
        echo "picom animations close"
        echo "picom fading open"
        echo "picom fading close"
        echo "touchpad"
				;;
			*)
				exit 0
		esac
		;;
	"mount") 
		$myconf/rofi/mount.sh $*
		;;
	"tran")
		$myconf/rofi/app/tran.sh $*
		;;
	"clash")
		$myconf/rofi/app/clash.sh $*
		;;
esac

