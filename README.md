# Bing Wallpapers For Trinity DE
This enables bing wallpapers on debian with Trinity DE.  
forked (& improved) from : https://github.com/whizzzkid/bing-wallpapers-for-linux

## Description
bingwallpaper.sh is a simple script that retrieve 'Bing image of the day' and set it as current wallpaper. It is designed for Trinity DE.  
You can run it 'singleshot' by just executing the script without arguments, run it as a daemon (-d), or add it to cron jobs (-c).  
  
You can put the script anywhere, but I recommend the folder /usr/local/bin so it will be available for all users as a direct command.  
  
## Settings
You can set the check interval in daemon/cronjob mode (-i); don't forget the image is renewed only once a day, so depending of your usage it's maybe not usefull to set a too short interval.  
You can specify too the folder where images will be downloaded (-f); if it doesn't exist yet, it will be created if possible.  
    
  
Usage:
 "bingwallpaper.sh"       run and exit
 "bingwallpaper.sh -d"    run as daemon
 "bingwallpaper.sh -k"    kill daemon
 "bingwallpaper.sh -c"    add task to cron
 "bingwallpaper.sh -r"    remove task from cron
 "bingwallpaper.sh -i"    set check interval
 "bingwallpaper.sh -f"    set wallpapers download folder
 "bingwallpaper.sh -p"    display status/settings
 "bingwallpaper.sh -h"    help
  
  
+-----------------------+

