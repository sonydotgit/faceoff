#!/bin/sh

count=0

while read lnks
do
    olnk=`awk '{print($1)}' <<< "$lnks"`

    yt-dlp -f 'ba' -x --audio-format mp3 "$olnk" -o 'down/%(title)s.%(ext)s'

    echo "****************************************"
    echo $olnk $ofr $oto
    echo "****************************************"

    count=$((count+1))

done < links.txt

notify-send "Finished Downloading Songs" "$count songs downloaded"
