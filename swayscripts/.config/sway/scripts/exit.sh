zenity --question --text="Are you sure you want to exit Sway"
if [ $? = 0 ]; then
    exec swaymsg exit
fi
