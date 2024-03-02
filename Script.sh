
! /bin/bash
file=cpu.log
path=/var/log

cd $path
if !(find $file)
then
        touch $file
fi

while true; do
        echo "$(date +%d/%m/%Y-%H:%M:%S)\t$(hostname -A)\t cpu_info=$(grep 'cpu' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')\t memory_info=$(free -m -t | grep "Mem:" | awk '{usage=($3)*100/($2)} END {print usage}' )" >> $file
done
