#!/bin/bash

# Check if our external monitor name is in the list connected displays
grep_output=`xrandr | grep HDMI-1`

if [ "$grep_output" != "" ]; then
    # The external monitor IS connected. Put it right of there internal and move xfce-panel there

    # Set up the displays
    xrandr --output HDMI-1 --mode 1600x900 --preferred --primary --pos 1366x0 --output LVDS-1 --mode 1366x768 --pos 0x0
else
    # The external monitor IS NOT connected.
    # Update monitor settings and move xfce-panel to internal monitor.
    # This becomes necessary if the external display was connected before and is now gone this will re-setup everything for single monitor use.

    # Set up the display
    xrandr --verbose --output LVDS-1 --mode 1366x768 --pos 0x0
fi
xfconf-query -v -c xfce4-panel -p /panels/panel-1/output-name -s LVDS-1
