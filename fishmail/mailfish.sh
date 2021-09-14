#! /bin/bash
python3 FishContent.py
time=`date "+%Y-%m-%d"`
while read LINE;
 do mail -s "摸鱼提醒"  $LINE <./content/fish${time}.txt;
done   < ./users/user1.txt
