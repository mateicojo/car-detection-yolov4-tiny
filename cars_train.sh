#!/bin/bash -e

cd /ai/nn/cars

# Warning: this file is automatically created/updated by DarkMark v1.9.1-2!
# Created on Fri 2024-09-13 19:42:53 EEST by matei@matei.

rm -f output.log
#rm -f chart.png

echo "creating new log file" > output.log
date >> output.log

ts1=$(date)
ts2=$(date +%s)
echo "initial ts1: ${ts1}" >> output.log
echo "initial ts2: ${ts2}" >> output.log
echo "cmd: /usr/bin/darknet detector -map -dont_show train /ai/nn/cars/cars.data /ai/nn/cars/cars.cfg" >> output.log

/usr/bin/time --verbose /usr/bin/darknet detector -map -dont_show train /ai/nn/cars/cars.data /ai/nn/cars/cars.cfg 2>&1 | tee --append output.log

ts3=$(date)
ts4=$(date +%s)
echo "ts1: ${ts1}" >> output.log
echo "ts2: ${ts2}" >> output.log
echo "ts3: ${ts3}" >> output.log
echo "ts4: ${ts4}" >> output.log

find /ai/nn/cars -maxdepth 1 -regex ".+_[0-9]+\.weights" -print -delete >> output.log

