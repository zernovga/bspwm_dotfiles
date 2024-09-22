dir="~/.config/polybar/scripts/rofi"
rofi_command="rofi -no-config -theme $dir/screen-layout.rasi"

# Options
mirror="Mirror"
onlyBuiltIn="Only Built-in"
onlyExternal="Only External"
extendTop="Extend Top"
extendBottom="Extend Bottom"
extendLeft="Extend Left"
extendRight="Extend Right"

# Variable passed to rofi
options="$mirror\n$onlyBuiltIn\n$onlyExternal\n$extendTop\n$extendBottom\n$extendLeft\n$extendRight"

chosen="$(echo -e "$options" | $rofi_command -p "Screen Layout" -dmenu -selected-row 0)"

case $chosen in
    $mirror)
        xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal
        ;;
    $onlyBuiltIn)
        xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off
        ;;
    $onlyExternal)
        xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output eDP --off
        ;;
    $extendTop)
        xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal
        ;;
    $extendLeft)
        xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal
        ;;
    $extendRight)
        xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal
        ;;
    $extendBottom)
        xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x1080 --rotate normal
        ;;
esac

sleep 2
MONITOR=$(polybar --list-monitors | grep primary | cut -d":" -f1) polybar --reload &
