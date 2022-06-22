#!/bin/sh

count=0

while read lnks
do
    ofr=`awk '{print($2)}' <<< "$lnks"`
    oto=`awk '{print($3)}' <<< "$lnks"`

    count=$((count+1))
    newfil=`ls -At *.mp3 | head -n $count | tail -n 1`

    ffmpeg -ss "$ofr" -to "$oto" -i "$newfil" "trm/""foff""$newfil"

    echo "****************************************"
    echo $count "$newfil"
    echo "****************************************"

done < ../links.txt

notify-send "Finished Trimming" "$count songs trimmed"
