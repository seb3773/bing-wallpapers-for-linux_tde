# Bing Wallpapers For Trinity DE
This enables bing wallpaper on debian with Trinity DE.  
forked from : https://github.com/whizzzkid/bing-wallpapers-for-linux

## Supported Desktop Environments

- Trinity DE

Just download or clone this repo. I suggest to put the bingwallpaper.sh script in /usr/local/bin/

Then run:

    $ bingwallpaper.sh

But this would keep on running as we check every 3 hours for new wallpaper. So it's better to do it this way:

    $ bingwallpaper.sh &>/dev/null &

## Run Once
To update the wallpaper only once (Instead of checking every 3 hours), Run:

    $ bingwallpaper.sh -1

## Setting Up Cron
To setup regular checks for new wallapers, edit crontab for the current user, using:

    $ crontab -u $USER -e

, and add this line:

    0 */6 * * * bingwallpaper.sh -1 > /dev/null 2>&1

This will run every 6 hours. You can use [this link](http://www.crontab-generator.org/) for reference.

## License
GPLv2
