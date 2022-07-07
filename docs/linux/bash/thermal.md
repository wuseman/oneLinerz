# thermal

### Print temperature without third-party 

```sh
cat /sys/class/thermal/thermal_zone*/temp 
```

### To see what zones the temperatures are referring to use:

```sh
paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/'    
```
### Monitor temps
```sh
getTemp () {
  for zone in `ls /sys/class/thermal/ | grep thermal_zone`
  do
    echo -n "`cat /sys/class/thermal/$zone/type`: "
    echo `cat /sys/class/thermal/$zone/temp | sed 's/\(.\)..$/.\1°C/'`
  done
}

getProcesses() {
  top -b -n 1 | head -n 12  | tail -n 6
}

update () {
  while :
  do
    clear
    getTemp
    echo -e "\nTop 5 CPU hogs:"
    getProcesses
    sleep 5
  done
}
```