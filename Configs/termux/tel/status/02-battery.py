#!/usr/bin/env python
#v0.4 24/04/20
import os
import json
import blessed
import subprocess
from blessed import Terminal
term = Terminal(force_styling=True) #force required if output not a tty

CHARGE_ICON = ""
DISCHARGE_ICON = "" 
MAX_CHARGE = 4400 # In mAh
os.system("pkill -f 'BatteryStatus'")
try:
    battery = json.loads(subprocess.check_output(["termux-battery-status"], universal_newlines=True, timeout=5)) 


    current = int(battery["current"])
    if current > 10000:
        # device reporting in microamps
        current = int(current / 1000)
     # Presuming device is reporting in milliamps otherwise
     part_per_hour = coloumb_per_hour / MAX_CHARGE
     percent_per_hour = part_per_hour * 100
     	
    if battery["status"] == "DISCHARGING":
        status = "Discharging"
        if battery["percentage"] >= 0 and battery["percentage"] <= 20:
            strengthcol = term.red
        elif 20 < and battery["percentage"] <= 40:
            strengthcol = term.orange
        elif 40 < battery["percentage"] <= 50:
            strengthcol = term.yellow
        else:
            strengthcol = term.green
        battery_str = strengthcol + DISCHARGE_ICON + term.normal + " " + str(battery["percentage"]) + "% " + status + " @ " +  str(current) + "mA"
        print(battery_str)
        
    else: # if charging
        if 0 <= percent_per_hour < 5:
            strengthcol = term.red
        elif 5 <= percent_per_hour < 15:
            strengthcol = term.orange
        elif 15 <= percent_per_hour < 25:
            strengthcol = term.yellow
        elif 25 <= percent_per_hour <= 50:
            strengthcol = term.greenyellow
        else: # if charging 50%/h or faster
            strengthcol = term.green
       # status = Charging
       # strengthcol = term.greenyellow
        battery_str = strengthcol + CHARGE_ICON + " " + str(battery["percentage"]) + "% " + status + " @ " + str(percent_per_hour) + "%/h" + term.normal
        if battery["health"] != "GOOD":
            warning = term.red + "  " + term.normal
            print(battery_str + warning)
        else:
            print(battery_str)
except:
    pass
    #print(DISCHARGE_ICON + " loading data")
exit()
