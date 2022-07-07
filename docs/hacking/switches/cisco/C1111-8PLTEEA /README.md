# C1111-8PLTEEA 

A **_good_** friend of mine came by with a nice surprise few weeks ago

- A Cisco router configured by TeliaSonera NOA devs, they really **suck** at protecting and keep things safe for their customers :)

### Notice: 

I have neither attempted to attack nor intrude on Telia's property by for example, brute-forcing their login for get access to any logs or setups used by Telia devs. . I have had full respect for their banner message. I have just put all my energy into getting the device wiped and get the device to a default state for my friend, I do not own this device so I am NOT the owner of any devices in this wiki. My friend is and will remain anonymous no matter what. 

With this said, let's go further! :) 

### Ups! I was met by this message immediately when I was about to log in via cli :)

NOC = Network Operations Center - Telia Sverige AB - Solna

    PASSWORD RECOVERY FUNCTIONALITY IS DISABLED
    Reset button push detected
    This functionality is disabled due to password protection

    Resetting ..Rom image verified correctly

    Current image running: Boot ROM0

    Last reset cause: LocalSoft
    C1111-8PLTEEA platform with 4194304 Kbytes of main memory

    **PASSWORD RECOVERY IS DISABLED.**
    Do you want to reset the router to the factory default
    configuration and proceed  y/n [n]: y

    **Router continuing with existing configuration...**

    no valid BOOT image found

    Press RETURN to get started!

    =================================================
       This device is the property of TeliaSonera.
    =================================================

       Access is ONLY allowed for NOC personnel at
                TeliaSonera Sverige AB.


    =================================================
     Warning: All unauthorized access is prohibited.
    =================================================

    User Access Verification
    Username:

### Device

    All TCP AO KDF Tests Pass
    cisco C1111-8PLTEEA (1RU) processor with 1415002K/6147K bytes of memory.
    Processor board ID FCZ3435913B
    Router operating mode: Autonomous
    1 Virtual Ethernet interface
    10 Gigabit Ethernet interfaces
    2 Cellular interfaces
    32768K bytes of non-volatile configuration memory.
    4194304K bytes of physical memory.
    2863103K bytes of flash memory at bootflash:.

Front 

![front](https://user-images.githubusercontent.com/26827453/175438983-7a1b33ef-91b0-4118-8680-7b6c39ef43a6.jpg)

Antennes are really huge. We need those for the dual sim 4G LTE

![antennes](https://user-images.githubusercontent.com/26827453/175438989-be5c9920-7b8e-4698-860d-1ae1c19ea73b.jpg)

Ports - Layer 2 

![layer2_ports](https://user-images.githubusercontent.com/26827453/175439003-d83da770-5641-42f3-9d4c-ad21ce5b7e24.jpg)

Those ports are: 0/1/0 -> 0/1/7

    show interfaces summary

     *: interface is up
     IHQ: pkts in input hold queue      IQD: pkts dropped from input queue
     OHQ: pkts in output hold queue     OQD: pkts dropped from output queue
     RXBS: rx rate (bits/sec)     RXPS: rx rate (pkts/sec)
     TXBS: tx rate (bits/sec)     TXPS: tx rate (pkts/sec)
     TRTL: throttle count

      Interface         IHQ         IQD         OHQ         OQD        RXBS        RXPS        TXBS        TXPS        TRTL
    -----------------------------------------------------------------------------------------------------------------
    * GigabitEthernet0/0/0     0    0    0    0        5000    6     146000    5    0
      GigabitEthernet0/0/1     0    0    0    0    0    0    0    0    0
      GigabitEthernet0/1/0     0    0    0    0    0    0    0    0    0
      GigabitEthernet0/1/1     0    0    0    0    0    0    0    0    0
      GigabitEthernet0/1/2     0    0    0    0    0    0    0    0    0
      GigabitEthernet0/1/3     0    0    0    0    0    0    0    0    0
      GigabitEthernet0/1/4     0    0    0    0    0    0    0    0    0
      GigabitEthernet0/1/5     0    0    0    0    0    0    0    0    0
      GigabitEthernet0/1/6     0    0    0    0    0    0    0    0    0
    * GigabitEthernet0/1/7     0    0    0    0    0    0    0    0    0
      Cellular0/2/0            0    0    0    0    0    0    0    0    0
      Cellular0/2/1            0    0    0    0    0    0    0    0    0

### Misc

Some default values I use in cli for easier managment and other useful stuff

    terminal length 0
    show running-config
    hostname <hostname>
    ip domain name <domain_name>
    ip default-gateway <ip>
    service password-encryption

### Setup Wizard - WebUI

![setup_wizard](https://user-images.githubusercontent.com/26827453/175439017-6cfd6949-2a76-4c73-a969-8bd3882b6cdd.png)

![setup_wizard2](https://user-images.githubusercontent.com/26827453/175439019-4ed0733f-b6d1-4108-b602-b298bb65d8ce.png)

![setup_wizard3](https://user-images.githubusercontent.com/26827453/175439020-8020be81-2042-443d-945d-77aefa7e7744.png)

![setup_wizard4](https://user-images.githubusercontent.com/26827453/175439021-f92437d9-0a60-4c4b-b48d-dccc6ee681e5.png)

![setup_wizard_5_wan](https://user-images.githubusercontent.com/26827453/175439030-2221684f-b3a2-4b39-b496-515462d34961.png)

![setup_wizard_6_finish](https://user-images.githubusercontent.com/26827453/175439033-4ae7d06c-a18a-468b-93d1-32c82e336d09.png)

![setup_wizard_7_finished](https://user-images.githubusercontent.com/26827453/175439034-80b1f440-15b3-4782-b9b6-c914e2ddbbcf.png)

![setup_wizard_8_testing](https://user-images.githubusercontent.com/26827453/175439035-2a6067ec-6bed-418d-87b5-682617261bed.png)

### Setup Wizard - CLI

You will enter setup wizard by type

    enable
    setup

Follow and Answer the questions, see begin of the cli wizard below

![setup_clig](https://user-images.githubusercontent.com/26827453/175439996-fabd76bb-f5ae-40c1-9bfa-cb4102a05915.png)

### Accounts / Passwords

    enable password <password>
    username <username> privilege 15 secret 0 <password>
    
### Reset Router to Factory Settings

    write erase
    delete nvram:*
    format bootflash:
    format flash:

Change the configure register value to ignore the startup configuration
by issuing the confreg command, as shown in this example:

    confreg 0x2142
    reload

After the router boots, issue the enable command at the Router > prompt. 
The prompt changes to Router#, indicating that the router is now in privileged mode.

    config t
    config-register 0x2142
    reload
    
   
### Controller

    Router#controller ?
      disable  controller-mode disable
      enable   controller-mode enable
      reset    controller-mode reset

    controller enable
      Enabling controller mode will erase the nvram filesystem, remove all configuration files, and reload the box! 


### Interface 

Reset an Interface really simple without alot of useless commands
 
    default interface GigabitEthernet0/0/0

Configuring Gigabit Ethernet Interfaces  - WAN - DHCP

    enable
    config t
    interface GigabitEthernet0/0/0
    ip address dhcp
    no shutdown
    exit

Configuring Gigabit Ethernet Interfaces  - LAN - STATIC
 
    interface GigabitEthernet0/0/1
    ip address 192.168.1.1 255.255.255.0
    negotiation auto
    no shutdown
    exit

###  Format / Erase / File Systems

Format File Systems:

    format flash:
    format bootflash:

Erase configuration files

    write erase
    erase nvram:

# TFTP Managment

![boot_tftp](https://user-images.githubusercontent.com/26827453/175440021-63b9bd12-f113-495f-be23-7f6dad30b217.gif)


###  TFTP Server (gnu/gentoo linux - tftp-hsa)
    
    cat << EOF > /etc/conf.d/in.tftpd
    #/etc/init.d/in.tftpd
    # Created by: wuseman
    TFTPD_PATH="/mnt/tftp"
    TFTPD_OPTS="-p -u nobody -s ${INTFTPD_PATH} -vvv"
    EOF

### Start tftp-hsa

    /etc/init.d/in.tftpd start

* Tftp is now running :)

 TFTP Client (Cisco Device)

    IP_ADDRESS=192.168.1.164
    IP_SUBNET_MASK=255.255.255.0
    DEFAULT_GATEWAY=192.168.1.1
    TFTP_SERVER=192.168.1.146
    TFTP_FILE=cisco/firmware/c1100-universalk9_ias.17.03.03.SPA.bin

Now execute:

    boot tftp: OR boot tftp://<tftp_server>/tftp_file.bin

Copy tftp binary to system.

     copy tftp system
     copy tftp://<tftp_server>/tftp_file.bin bootflash:

# Configure Boot

Bootvar

    show bootvar    
    enable
    configure terminal
    copy tftp://<tftp_server>/tftp_file.bin flash:
    boot system flash bootflash:c1100-universalk9_ias.17.03.03.SPA.bin
    boot config flash:startup-config
    end
    
    config-reg 0x2102
    copy run start
    reload

# WEBUI 

### Enable WebUI

    ip http server
    ip http authentication local
    ip http port <http_port>
    ip http secure-port <https_port>
    ip http accounting commands 15 default
    ip http max-connections 2
    ip http client cache memory file 5
    ip http client connection timeout 10
    ip http client password <password>
    ip http client username <username>
    ip http path webui:
    
Access List

    ip access-list standard 20 
     permit <ip> 0.0.0.255 
     permit <ip> 0.0.255.255 
     permit <ip> 0.255.255.255 
    ! (Note: all other access implicitly denied)
     end 

### Remote Managment

Setup SSH:

    enable
    config t
    crypto key generate rsa
    # crypto key generate rsa general-keys modulus 2048
    line vty 0 4
    login local
    transport input ssh
    end

Verify SSH is installed and configured

    ctrl+c
    sh ip ssh

Setup Telnet:

    config t
    line vty 0 4
    login local
    transport input telnet
    exit

### Cellular - LTE - GPS

Unlock Sim

    cellular 0/2/1 lte sim unlock <pin_code>
    
Activate Firmare

    cellular 0/2/1 lte firmware-activate

Fota 

    cellular 0/2/1 lte fota

Profile 

    cellular 0/2/1 lte profile 
    cellular 0/2/0 lte profile create 1
    cellular 0/2/0 lte profile delete 1

PLMNM 

    cellular 0/2/1 lte plmn
    cellular 0/2/0 lte plmn search
    cellular 0/2/0 lte plmn select
    ellular 0/2/0 lte plmn select auto


Copy 

    cellular 0/2/0 copy file
    cellular 0/2/0 copy modem-crashdump

Sim 

    cellular 0/2/1 lte sim 

Sms 

    cellular 0/2/1 lte sms
    cellular 0/2/0 lte sms view all
    cellular 0/2/0 lte sms view summary
    cellular 0/2/1 lte sim activate slot 1
    cellular 0/2/0 lte sim change pin <xxxx> <xxxx>
    cellular 0/2/0 lte sim lock <xxxx>
    cellular 0/2/0 lte sim unblock
    cellular 0/2/0 lte sim unlock <xxxx>

Technology

    cellular 0/2/1 lte  technology


Disable SIM

    controller cellular 0/2/0
    no lte firmware auto-sim
    - %LINK-3-UPDOWN: Interface Cellular0/2/0, changed state to down
    - %LINK-3-UPDOWN: Interface Cellular0/2/1, changed state to down

   
Firmware 

    show cellular 0/2/0 profile firmware

Hardware

    Router>show cellular 0/2/0 hardware
        Modem Firmware Version = SWI9X30C_02.30.01.01
        Device Model ID =  EM7455
        International Mobile Subscriber Identity (IMSI) = 
        International Mobile Equipment Identity (IMEI) = XXX12XXXX5XX9XX
        Integrated Circuit Card ID (ICCID) = 
        Mobile Subscriber Integrated Services
        Digital Network-Number (MSISDN) = 
        Factory Serial Number (FSN) = LFXXXXXXXXXXXX
        Modem Status = Modem Online
        Current Modem Temperature = 33 deg C
        PRI SKU ID = 1102526, PRI version = 002.045_001, Carrier = GENERIC
        OEM PRI version = 000.012

Connection 

    show cellular 0/2/0 connection

GPS

    show cellular 0/2/1 gps

Radio

    show cellular 0/2/1 radio

Logs

    show cellular 0/2/1 logs
    
Interface

    interface Cellular0/2/0
        LTE Adv CAT6 - Multimode LTE/DC-HSPA+/HSPA+/HSPA/UMTS/EDGE/GPRS unit 2

        Cellular Modem Configuration
        ==============================
        Modem is recognized as valid
        Power save mode is OFF
        manufacture id =  0x00001199     product id = 0x00009071
                Sierra Wireless Direct IP EM7455 modem
          
        GPS Feature = enabled
        GPS Status =  NMEA Disabled
        GPS Mode = not configured
          
        Cellular Dual SIM details:
        ---------------------------
        No SIM present
          
        Module Reload Statistics
        -------------------------
        Soft OIR reloads = 0
        Hard OIR reloads = 0

### Logs / Syslog

![Screenshot](cisco_syslog_remote.gif)

Configure Syslog 

    no logging console
    logging source-interface Loopback0
    logging <syslog-server1>
    logging <syslog-server2>
    logging buffered 64000 debugging
    logging facility <facility>
    logging trap informational  
    logging rate-limit <#msgs/sec> except 2

Read Logs

    show log last 10
    show log | i Ethernet110/1/11 | i down | count 

### Banner / Message Of The Day 

SSH Login 

    banner login #

    +*************************************************************************+
    *      L E G A L   N O T I C E  --  Y O U    M U S T    R E A D           *
    ***************************************************************************
    *                                                                         *
    *     You must have explicit permission to access or configure this       *
    *      device.  All activities performed on this device are logged and    *
    *     violations of this policy may result in criminal prosecution.       *
    *                                                                         *
    ***************************************************************************
    *                                                                         *
    * This system is for the use of authorized users only. Individuals using  *
    *this computer system without authority, or in excess of their authority, *
    * are subject to having all of their activities on this system monitored  *
    * and recorded by system personnel.                                       *
    *                                                                         *
    *                                                                         *
    *  Anyone using this system expressly consents to such monitoring and is  *
    * advised that if such monitoring reveals possible evidence of criminal   *
    * activity, system personnel may provide the evidence of such monitoring  *
    * to law enforcement officials.                                           *
        *                                                                         *
    ***************************************************************************
    *         UNAUTHORIZED ACCESS TO THIS NETWORK DEVICE IS PROHIBITED        *
    ***************************************************************************
    
    #
    
### Subslots

    %SPA_OIR-6-ONLINECARD: SPA (C1111-2x1GE) online in subslot 0/0
    %SPA_OIR-6-ONLINECARD: SPA (C1111-ES-8) online in subslot 0/1
    %SPA_OIR-6-ONLINECARD: SPA (C1111-LTE) online in subslot 0/2
   
### Guestshell 

bash
    
     app-hosting appid guestshell
     vnic management guest-interface 0
     end
     guestshell enable
     guestshell run bash

### Disabling Unnecessary Services

    no ip bootp server
    no ip source-route
    no service pad

### Rmmon

    boot system flash:/c1100-universalk9_ias.17.03.02.SPA.bin
    
Rommon - Ignore startup config 

    confreg 0x2142
    rset 
    
### Errors / Fails / Problems / Issues

    *May 25 23:32:31.037: %SYS-4-CONFIG_RESOLVE_FAILURE: System config parse from (tftp://255.255.255.255/network-confg) failed
    *May 25 23:32:31.038: %SYS-4-CONFIG_RESOLVE_FAILURE: System config parse from (tftp://255.255.255.255/router-confg) failed

Below will solve this error
      
      enable
      config t
      no service config

### A wierd bug with menu and https enable, but don't worry -  I got you covered ;-)

![Screenshot](cisco_wierd_menu_error.gif)

### Some awesome pages for different kind of cisco hacking

<br>https://protocoholic.com/2018/05/29/configuring-cisco-c1111-4pltea-router-for-4g-3g-cellular-communication/
<br>https://ciscotips.wordpress.com/
<br>https://www.cisco.com/c/en/us/td/docs/solutions/Enterprise/Security/Baseline_Security/securebasebook/appendxA.html
<br>https://www.ccna6rs.com/10-4-4-lab-build-a-switch-and-router-network-answers/
<br>https://ciscorouterreview.weebly.com/how-to-setup-cisco-router-auxiliary-console-and-telnet-passwords.html
<br>https://blog.router-switch.com/2012/01/how-to-recover-password-on-cisco-routerswitch/

### CONTACT 

If you have problems, questions, ideas or suggestions please contact me by posting to wuseman@nr1.nu

### WEB SITE

Visit my websites and profiles for the latest info and updated tools

https://github.com/wuseman/ && https://nr1.nu && https://stackoverflow.com/users/9887151/wuseman

### END!
