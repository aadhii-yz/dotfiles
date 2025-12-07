#!/bin/env bash

set_status_bar() {
  # Get Data
  b="🔋: $(upower -i "$(upower -e | grep BAT)" | grep percentage | awk '{print $2}')"
  d="📆: $(date +"%a %d/%m/%y")"
  t="⏳: $(date +"%I:%M %p")"

  # Set Format
  status="[ $t | $d | $b ]"

  # Set StatusBar
  xprop -root -set WM_NAME "$status"
}

while true; do
  set_status_bar
  watch_bt
  sleep 60
done
