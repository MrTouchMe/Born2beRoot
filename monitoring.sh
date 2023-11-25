cpul=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.2f%%", usage}')
lb=$(who -b | awk '$1 == "system" {print $3 " " $4}')
lvmu=$(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)
ctcp=$(ss -tln | tail -n +2 | wc -l)
ulog=$(users | wc -w)
ip=$(hostname -I)
mac=$(ip link show | awk '/ether/ {print $2}')
cmds=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

wall "#Architecture: $arc
#CPU physical: $pcpu
#vCPU: $vcpu
#Memory Usage: $uram/${fram}MB ($pram%)
#Disk Usage: $udisk/${fdisk}GB ($pdisk%)
#CPU load: $cpul
#Last boot: $lb
#LVM use: $lvmu
#Connections TCP: $ctcp
#User log: $ulog
#Network: IP $ip ($mac)
#Sudo: $cmds cmd"
