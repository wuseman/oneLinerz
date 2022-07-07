# systemd

### Show a unit’s dependencies
    
    systemctl list-dependencies 

### List sockets and what activates

    systemctl list-sockets 

### View active systemd jobs

    systemctl list-jobs 

### See unit files and their states

    systemctl list-unit-files 

### Show if units are loaded/active

    systemctl list-units 

### List default target (like run level)

    systemctl get-default 

### Stop a running service

    systemctl stop service 

### Start a service

    systemctl start service 

### Restart a running service

    systemctl restart service 

### Reload all config files in service

    systemctl reload service 

### Must run to reload changed unit files

    systemctl daemon-reload 

### See if service is running/enabled

    systemctl status service 

### Shows services that failed to run

    systemctl --failed 

### Resets any units from failed state

    systemctl reset-failed 

### Enable a service to start on boot

    systemctl enable service 

### Disable service--won’t start at boot

    systemctl disable service 

### Show properties of a service (or other unit)

    systemctl show service 

### Create snippit to drop in unit file

    systemctl edit service 

### Edit entire unit file for service

    systemctl edit --full service 

### Run any systemctl command remotel

    systemctl -H host status network 


### To start a daemon at startup:

    update-rc.d service_name defaults
        systemctl enable minidlna.service

### To remove a daemon at startup:

    update-rc.d -f service_name remove
        systemctl disable minidlna.service

### Above services is stored in

        ls /lib/systemd/system/*.service
    ls /etc/systemd/system/*.service
