#!/bin/sh

network_print() {
  echo $(iwgetid -r)
}

network_update() {
    pid=$(cat "$path_pid")

    if [ "$pid" != "" ]; then
        kill -10 "$pid"
    fi
}

path_pid="/home/$USER/.config/polybar/scripts/networkmanager.pid"

case "$1" in
    --update)
        network_update
        ;;
    *)
        echo $$ > $path_pid

        trap exit INT
        trap "echo" USR1

        while true; do
            network_print

            sleep 60 &
            wait
        done
        ;;
esac
