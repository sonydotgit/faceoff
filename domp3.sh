#!/bin/sh

count=0

while read lnks
do
    olnk=`awk '{print($1)}' <<< "$lnks"`

    yt-dlp -f 'ba' -x --audio-format mp3 "$olnk" -o 'down/%(title)s.%(ext)s'

    count=$((count+1))

    echo "****************************************"
    echo $olnk
    echo $count done
    echo "****************************************"

done < links.txt

notify-send "Finished Downloading" "$count song(s) downloaded"
