i#!/bin/bash -e
start_time="$(echo $(date '+%Y-%m-%d_%H-%M-%S'))"
echo $(echo "      date     time $(free -m | grep total | sed -E 's/^    (.*)/\1/g')") > /home/ubuntu/logs/memory/mem_log_${start_time}.log
while true; do
	echo $(echo "$(date '+%Y-%m-%d %H:%M:%S') $(free -m | grep Mem: | sed 's/Mem://g')") >> /home/ubuntu/logs/memory/mem_log_${start_time}.log
	sleep 10
done
