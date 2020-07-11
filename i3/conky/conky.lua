conky.config = {
-- Conky configuration file
-- Output is printed to the console -> i3bar

--# No output to X <yes/no>
	out_to_x = false, --# Create own window to draw <yes/no> own_window = false,

--# Print everything to console?
	out_to_console = true,

--# Use double buffering (reduces flicker, not needed for console output)
	double_buffer = false,

--# Set to yes if you want Conky to be forked in the background
	background = false,

--# Update interval in seconds
	update_interval = 1,

--# This is the number of times Conky will update before quitting.
--# Set to zero to run forever.
	total_run_times = 0,

--# Shortens units to a single character (kiB->k, GiB->G, etc.). Default is off.
	short_units = true,

--# How strict should if_up be when testing an interface for being up?
--# The value is one of up, link or address, to check for the interface
--# being solely up, being up and having link or being up, having link
--# and an assigned IP address.
	if_up_strictness = 'address',

--# Add spaces to keep things from moving about?  This only affects certain objects.
--# use_spacer should have an argument of left, right, or none
	use_spacer = 'none',

--# Force UTF8? note that UTF8 support required XFT
	override_utf8_locale = false,

--# number of cpu samples to average
--# set to 1 to disable averaging
	cpu_avg_samples = 2,

	pad_percents = 2,

	color0 = '#cccccc',
	template0 = [["border_bottom": 2, "border_top": 0, "border_left": 0, "border_right": 2]],


	default_color = 'white',
	default_shade_color = 'black',
	default_outline_color = 'white',

--# Stuff after 'TEXT' will be formatted on screen
};

conky.text = [[

# JSON for i3bar
[
# {
#     "full_text": "${exec xprop -id $(xdotool getactivewindow) | grep _NET_WM_NAME | cut -d '"' -f2- | sed 's/"$//' | cut -c-20}",
#     "color": "\#000000",
#     "background": "\#FFFFFF",
#     "min_width": "here's a veeeeeeeeeeeeeeeeeeeery long title",
#     "align": "center"
# },
#${if_empty ${exec cat /sys/class/power_supply/BAT0/status | grep 'Charging'}}
#    ${if_match ${battery_percent BAT0} <= 10 }
#{
#    "full_text": "Plug In Charger!!!",
#    "urgent": true,
#    "color": "\#FF0000"
#},
#    ${endif}
#${endif}
${if_match "${exec xset q | grep 'Caps Lock' | sed 's/.*Caps Lock:[ ]*\([^ ]*\).*/\1/'}"=="on"}
{
    "full_text": "CapsLock",
    "color": "\#00FF00"
},
${endif}
#{
#   "full_text": "${exec whoami}@${nodename} "
#},
${if_up vpn0}
{
    "full_text": " ${addr vpn0}",
    "color": "\#00FF00"
},
${endif}
${if_up tun0}
{
    "full_text": "  ${addr tun0}",
    "color": "\#00FF00"
},
${endif}
${if_up enp3s0}
{
    "full_text": " 🜷 ${addr enp3s0} ",
    "border": "\#cccccc",
    ${template0},
    "separator_block_width": 3
},
${endif}
${if_up wlan0}
{
    "full_text": "  ${addr wlan0} ",
    "border": "\#cccccc",
    ${template0},
    "separator": false,
    "separator_block_width": 3
},
${endif}
{
    "full_text": " ${fs_used}/ ${fs_free} (${fs_free_perc /}%) ",
    "separator_block_width": 3,
    ${template0},
    ${if_match ${fs_free_perc /}>=30}
        "border": "\#cccccc"
    ${endif}
    ${if_match ${fs_free_perc /}<30}
        ${if_match ${fs_free_perc /}>=20}
            "border": "\#ffff99"  # yellow
        ${endif}
    ${endif}
    ${if_match ${fs_free_perc /}<20}
        ${if_match ${fs_free_perc /}>=10}
            "border": "\#ff9933"  # orange
        ${endif}
    ${endif}
    ${if_match ${fs_free_perc /}<10}
        "color": "\#ff0000",  # red
        "border": "\#ff0000"  # red
    ${endif}
},
{
    "full_text": " H ${fs_used /home}/${fs_free /home} (${fs_free_perc /home}%) ",
    "separator_block_width": 3,
    ${template0},
		${if_match ${fs_free_perc /home}>=30}
		    "border": "\#cccccc"
		${endif}
		${if_match ${fs_free_perc /home}<30}
		    ${if_match ${fs_free_perc /home}>=20}
		        "border": "\#ffff99"
		    ${endif}
		${endif}
		${if_match ${fs_free_perc /home}<20}
		    ${if_match ${fs_free_perc /home}>=10}
		        "border": "\#ff9933"
		    ${endif}
		${endif}
		${if_match ${fs_free_perc /home}<10}
		    "color": "\#ff0000",
		    "border": "\#ff0000"
		${endif}
},
{
    "full_text": " R ${memperc}% ",
		"separator": false,
    "separator_block_width": 3,
    ${template0},
		${if_match ${memperc}>=80}
		    # red
		    "color": "\#ff0000",  # red
		    "border": "\#ff0000"
		${endif}
		${if_match ${memperc}<80}
		    ${if_match ${memperc}>=70}
		        # orange
		        "border": "\#ff9933"
		    ${endif}
		${endif}
		${if_match ${memperc}<70}
		    ${if_match ${memperc}>=60}
		        # yellow
		        "border": "\#ffff99"
		    ${endif}
		${endif}
		${if_match ${memperc}<60}
		    # green
		    "border": "\#cccccc"
		${endif}
},
{
    "full_text": "S ${swapperc}% ",
    "separator_block_width": 3,
    ${template0},
		${if_match ${swapperc}>=80}
		    # red
		    "color": "\#ff0000",  # red
		    "border": "\#ff0000"
		${endif}
		${if_match ${swapperc}<80}
		    ${if_match ${swapperc}>=70}
		        # orange
		        "border": "\#ff9933"
		    ${endif}
		${endif}
		${if_match ${swapperc}<70}
		    ${if_match ${swapperc}>=60}
		        # yellow
		        "border": "\#ffff99"
		    ${endif}
		${endif}
		${if_match ${swapperc}<60}
		    # green
		    "border": "\#cccccc"
		${endif}
},
{
   "full_text": " CPU: ${cpu cpu0}% ${execi 10 sensors | grep 'Physical' | cut -c18-24}",
   "color": ${if_match ${cpu cpu0}>90}"\#FF0000"${else}${if_match ${cpu cpu0}<15}"\#00CC00"${else}"\#ffffff"${endif}${endif}
},
#{
#    "full_text": " ${exec sensors acpitz-virtual-0 | grep 'temp2' | awk '{print $2}'} ",
#    "border": "\#cccccc",
#    ${template0},
#    "separator_block_width": 3
#},
#{
#    "full_text": " 🍥 ${exec sensors asus-isa-0000 | grep 'cpu_fan' | awk '{print $2$3}'} ",
#    "border": "\#cccccc",
#    ${template0},
#    "separator_block_width": 3
#},
{
	"full_text": " D:${downspeed enp3s0}/s",
	"border": "\#cccccc",
	${template0},
	"separator": false,
	"separator_block_width": 3,
	"color": "\#00ffff"
},
{
	"full_text": " U: ${upspeed enp3s0}/s",
	"border": "\#cccccc",
	${template0},
	"separator": false,
	"separator_block_width": 3,
	"color": "\#ff00ff"
},
{
	"full_text": " T: ${totaldown enp3s0}",
	"color": "\#ffff00"
},
{
    "full_text": " ${uptime_short} ",
    "min_width": "59m59s",
    "border": "\#cccccc",
    ${template0},
    "separator_block_width": 3
},
{
    "full_text": " ♪ ${exec ~/.config/i3/conky/volumelevel.sh}% ",
    "color": ${if_empty ${exec ~/.config/i3/conky/volumelevel.sh | grep 'Mute'}}"\#cccccc"${else}"\#ffff00"${endif},
    "border": "\#cccccc",
    ${template0},
    "separator_block_width": 3
},
# ${if_match ${exec /usr/lib/update-notifier/update-motd-updates-available | grep 'security' | awk '{print $1}'}>0}
# {
#     "full_text": "⚠ ${exec /usr/lib/update-notifier/update-motd-updates-available | grep 'security' | awk '{print $1}'} security updates",
#     "color": "\#ff0000",  # red
#     "border": "\#ff0000",  # red
#     "separator_block_width": 3,
#     ${template0}
# },
{
	"full_text": " ${execi 600 ~/.config/i3/conky/weather.sh}",
	"color": "\#00FF00"
},
{
	"full_text": " ${time %a %m/%d/%y} - ${time %H:%M:%S}",
	"color": "\#FFD700"
}
],
]];
