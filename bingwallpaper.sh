#!/bin/bash
# author: Whizzzkid (me@nishantarora.in)
#forked  & modified for Trinity DE

# Base URL.
bing="http://www.bing.com"

# API end point.
api="/HPImageArchive.aspx?"

# Response Format (json|xml).
format="&format=js"

# For day (0=current; 1=yesterday... so on).
day="&idx=0"

# Market for image.
market="&mkt=en-US"

# API Constant (fetch how many).
const="&n=1"

# Image extension.
extn=".jpg"

# Size.
size="1920x1200"

# Collection Path.
path="$HOME/Pictures/Bing/"

# Make it run just once (useful to run as a cron)
run_once=false
while getopts "1" opt; do
  case $opt in
    1 )
      run_once=true
      ;;
    \? )
      echo "Invalid option! usage: \"$0 -1\", to run once and exit"
      exit 1
      ;;
  esac
done

########################################################################
#### DO NOT EDIT BELOW THIS LINE #######################################
########################################################################

# Required Image Uri.
reqImg=$bing$api$format$day$market$const

while [ 1 ]
do

  # Logging.
  echo "Pinging Bing API..."

  # Fetching API response.
  apiResp=$(curl -s $reqImg)
  if [ $? -gt 0 ]; then
    echo "Ping failed!"
    exit 1
  fi

  # Default image URL in case the required is not available.
  defImgURL=$bing$(echo $apiResp | grep -oP "url\":\"[^\"]*" | cut -d "\"" -f 3)

  # Req image url (raw).
  reqImgURL=$bing$(echo $apiResp | grep -oP "urlbase\":\"[^\"]*" | cut -d "\"" -f 3)"_"$size$extn

  # Checking if reqImgURL exists.
  if ! wget --quiet --spider --max-redirect 0 $reqImgURL; then
    reqImgURL=$defImgURL
  fi

  # Logging.
  echo "Bing Image of the day: $reqImgURL"

  # Getting Image Name.
  imgName=${reqImgURL##*/}

  # Create Path Dir.
  mkdir -p $path

  # Saving Image to collection.
  curl -L -s -o $path$imgName $reqImgURL

  # Logging.
  echo "Saving image to $path$imgName"

dcop kdesktop KBackgroundIface setWallpaper "$path$imgName" 6

  # If -1 option was passed just run once
  if [ $run_once == true ];then
    break
  fi

  # Re-checks for updates every 3 hours.
  sleep 10800
done
