alias uplight="xbacklight -inc 10"
alias downlight="xbacklight -dec 10"

alias togglemute="pactl -- set-sink-mute @DEFAULT_SINK@ toggle"
alias togglemutemic="sh ~/.config/fish/scripts/pulseaudio/togglemic.sh"

alias upvolume="pactl set-sink-volume @DEFAULT_SINK@ +5%"
alias downvolume="pactl set-sink-volume @DEFAULT_SINK@ -5%"
