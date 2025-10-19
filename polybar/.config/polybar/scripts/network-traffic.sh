#!/bin/bash

# Function to format bytes per second into human-readable speed (B/s, kB/s, MB/s)
print_bytes() {
    local bytes_per_sec=$1 # Use a local variable for clarity and safety
    local formatted_speed

    # If speed is 0, explicitly show "0 kB/s"
    if (( bytes_per_sec == 0 )); then
        formatted_speed="0 kB/s"
    # If speed is less than 1 MB/s, show in KB/s
    elif (( bytes_per_sec < 1000000 )); then
        # Round to nearest integer KB/s: add 500 for rounding before integer division
        formatted_speed="$(echo "scale=0; ($bytes_per_sec + 500) / 1000" | bc) kB/s"
    # If speed is 1 MB/s or greater, show in MB/s
    else
        # Round to one decimal place MB/s: add 50000 for rounding before division
        formatted_speed="$(echo "scale=1; ($bytes_per_sec + 50000) / 1000000" | bc) MB/s"
    fi

    echo "$formatted_speed"
}

INTERVAL=2          # How often to sample data (seconds)
WINDOW_SECONDS=10   # Over what period to average the speed (seconds)
# Calculate how many samples we need to keep in our history
HISTORY_SIZE=$((WINDOW_SECONDS / INTERVAL)) 

# Get active network interfaces (excluding 'lo' and focusing on common physical/wireless)
# 'ip -o link show' lists interfaces. 'awk' extracts the name.
# 'grep -E "^(en|wl|eth|wlan)"' filters for common Ethernet (en, eth) and Wireless (wl, wlan) interfaces.
# Adjust the grep pattern if your interfaces have different prefixes (e.g., 'ens', 'wlo').
INTERFACES=$( ip -o link show | awk -F': ' '{print $2}' | grep -E "^(en|wl|eth|wlan)" )

# Declare associative arrays to store the history of byte counts for each interface.
# The values will be space-separated strings of byte counts.
declare -A bytes_history_rx
declare -A bytes_history_tx

# Initialize history for each interface.
# We populate the history with the current reading 'HISTORY_SIZE' times.
# This ensures that from the very first calculation, we have enough "past" data points
# to correctly calculate the average over the full WINDOW_SECONDS.
for interface in $INTERFACES; do
    current_rx_bytes=0
    current_tx_bytes=0

    # Read current byte counts, handling cases where files might not exist
    if [ -f "/sys/class/net/$interface/statistics/rx_bytes" ]; then
        current_rx_bytes=$(cat "/sys/class/net/$interface/statistics/rx_bytes")
    fi
    if [ -f "/sys/class/net/$interface/statistics/tx_bytes" ]; then
        current_tx_bytes=$(cat "/sys/class/net/$interface/statistics/tx_bytes")
    fi

    # Add the current byte count to the history string 'HISTORY_SIZE' times
    for ((i=0; i<HISTORY_SIZE; i++)); do
        bytes_history_rx["$interface"]="${bytes_history_rx["$interface"]} $current_rx_bytes"
        bytes_history_tx["$interface"]="${bytes_history_tx["$interface"]} $current_tx_bytes"
    done
    # Remove any leading space that might result from the first append
    bytes_history_rx["$interface"]=$(echo "${bytes_history_rx["$interface"]}" | sed 's/^ //')
    bytes_history_tx["$interface"]=$(echo "${bytes_history_tx["$interface"]}" | sed 's/^ //')
done

# Main loop to continuously calculate and print average speeds
while true; do
    down_total_window_bytes=0 # Accumulator for total downloaded bytes over the window
    up_total_window_bytes=0   # Accumulator for total uploaded bytes over the window

    for interface in $INTERFACES; do
        current_rx_bytes=0
        current_tx_bytes=0

        # Read current byte counts for the interface
        if [ -f "/sys/class/net/$interface/statistics/rx_bytes" ]; then
            current_rx_bytes=$(cat "/sys/class/net/$interface/statistics/rx_bytes")
        fi
        if [ -f "/sys/class/net/$interface/statistics/tx_bytes" ]; then
            current_tx_bytes=$(cat "/sys/class/net/$interface/statistics/tx_bytes")
        fi

        # Append the new current byte count to the history string for this interface
        bytes_history_rx["$interface"]="${bytes_history_rx["$interface"]} $current_rx_bytes"
        bytes_history_tx["$interface"]="${bytes_history_tx["$interface"]} $current_tx_bytes"

        # Use awk to keep only the last HISTORY_SIZE samples in the history string.
        # This effectively creates a "sliding window" or "circular buffer" of data.
        bytes_history_rx["$interface"]=$(echo "${bytes_history_rx["$interface"]}" | awk -v n=$HISTORY_SIZE '{ for(i=NF-n+1; i<=NF; i++) printf "%s%s", $i, (i==NF?"":" "); print "" }')
        bytes_history_tx["$interface"]=$(echo "${bytes_history_tx["$interface"]}" | awk -v n=$HISTORY_SIZE '{ for(i=NF-n+1; i<=NF; i++) printf "%s%s", $i, (i==NF?"":" "); print "" }')

        # Get the oldest and newest readings from the current history window for this interface.
        # The first field in the space-separated string is the oldest, the last is the newest.
        oldest_rx=$(echo "${bytes_history_rx["$interface"]}" | awk '{print $1}')
        newest_rx=$(echo "${bytes_history_rx["$interface"]}" | awk '{print $NF}')

        oldest_tx=$(echo "${bytes_history_tx["$interface"]}" | awk '{print $1}')
        newest_tx=$(echo "${bytes_history_tx["$interface"]}" | awk '{print $NF}')

        # Calculate the total bytes transferred over the entire WINDOW_SECONDS for this interface.
        # Handle cases where the counter might have reset (e.g., interface reconnected) by clamping to 0.
        diff_rx=$(( newest_rx - oldest_rx ))
        if (( diff_rx < 0 )); then diff_rx=0; fi

        diff_tx=$(( newest_tx - oldest_tx ))
        if (( diff_tx < 0 )); then diff_tx=0; fi

        # Add this interface's total bytes over the window to the global totals
        down_total_window_bytes=$(( down_total_window_bytes + diff_rx ))
        up_total_window_bytes=$(( up_total_window_bytes + diff_tx ))
    done

    # Calculate the average speed (bytes per second) over the WINDOW_SECONDS
    avg_down_speed=$(( down_total_window_bytes / WINDOW_SECONDS ))
    avg_up_speed=$(( up_total_window_bytes / WINDOW_SECONDS ))

    # Print the formatted total speeds for Polybar, using specific colors
    # %{F#61afef} sets the foreground color for the icon (e.g., blueish from Nord theme)
    # %{F#abb2bf} sets the foreground color for the text (e.g., greyish from Nord theme)
    echo " %{F#61afef} %{F#abb2bf}$(print_bytes "$avg_down_speed") %{F#61afef}%{F#abb2bf} $(print_bytes "$avg_up_speed")"

    # Wait for the next interval before the next calculation
    sleep "$INTERVAL"
done
