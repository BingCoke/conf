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
      "picom-100")
				coproc (picom-trans -s 100 >/dev/null 2>&1)
        ;;
      "picom-reset")
        picom-trans --reset
        ;;
      "picom-delete")
				coproc (picom-trans -s --delete >/dev/null 2>&1)
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
        echo "picom-100"
        echo "picom-reset"
        echo "picom-delete"
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

