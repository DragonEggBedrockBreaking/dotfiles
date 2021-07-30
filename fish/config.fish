alias uplight="xbacklight -inc 10"
alias downlight="xbacklight -dec 10"

alias togglemute="pactl -- set-sink-mute @DEFAULT_SINK@ toggle"
alias mute="pactl -- set-sink-mute @DEFAULT_SINK@ true"
alias unmute="pactl -- set-sink-mute @DEFAULT_SINK@ false"

alias upvolume="pactl set-sink-volume @DEFAULT_SINK@ +10%"
alias downvolume="pactl set-sink-volume @DEFAULT_SINK@ -10%"

function on_exit --on-event fish_exit
	echo goodbye
end
