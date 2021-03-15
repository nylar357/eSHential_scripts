#!/bin/bash

echo "Iniating Speedtest - Be patient for the next 45 seconds" &
sleep 1s &
bash /home/nylar/configs/speedtest.sh
sleep 3s &
cat ~/speedtest.txt &
sleep 1s &
echo "Speedtest Concluded - output file @ ~/speedtest.txt"
