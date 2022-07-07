# tcpdump

 [TCPDUMP](https://wuseman.github.io/TCPDUMP/)


Tcpdump is one of the best network analysis-tools ever for information security professionals. 
Tcpdump is for everyone for hackers and people who have less of TCP/IP understanding. 

Many prefer to use higher-level analysis tools such Wireshark, _but I believe it is a mistake_. 

```
#### Below are some tcpdump options (with useful examples) that will help you working with the tool. They’re very easy to forget and/or confuse with other types of filters, i.e. ethereal, so hopefully this article can serve as a reference for you, as it does me:)

* The first of these is -n, which requests that names are not resolved, resulting in the IPs themselves.
* The second is -X, which displays both hex and ascii content within the packet.
* The final one is -S, which changes the display of sequence numbers to absolute rather than relative.

```
### Show the packet’s contents in both hex and ascii.   

```sh
tcpdump -X ....         
      
```
### Same as -X, but also shows the ethernet header.
  
```sh
tcpdump -XX

```
###  Show the list of available interfaces

```sh
tcpdump -D

```
### Line-readable output (for viewing as you save, or sending to other commands)

```sh
tcpdump -l

```
### Be less verbose (more quiet) with your output.

```sh
tcpdump -q

```
### Give human-readable timestamp output.

```sh
tcpdump -t :

```
### Give maximally human-readable timestamp output.

```sh
tcpdump -tttt : 

```
### Listen on the eth0 interface.

```sh
tcpdump -i eth0

```
### Verbose output (more v’s gives more output).

```sh
tcpdump -vv 

```
### Only get x number of packets and then stop.
  
```sh
tcpdump -c 

```
### Define the snaplength (size) of the capture in bytes. Use -s0 to get everything, unless you are intentionally capturing less.

```sh
tcpdump -s 

```
### Print absolute sequence numbers.
  
```sh
tcpdump -S 

```
### Get the ethernet header as well.
    
```sh
tcpdump -e 

```
### Decrypt IPSEC traffic by providing an encryption key.
    
```sh
tcpdump -E

```
### For more options, read manual:

* Find all options [here](https://www.cyberciti.biz/howto/question/man/tcpdump-man-page-with-examples.php)

# BASIC USAGE

```
###  Display Available Interfaces

```sh
tcpdump -D
```sh
tcpdump --list-interfaces
   
```
### Let’s start with a basic command that will get us HTTPS traffic:

```sh
tcpdump -nnSX port 443

```
### Find Traffic by IP

```sh
tcpdump host 1.1.1.1

```
### Filtering by Source and/or Destination

```sh
tcpdump src 1.1.1.1 
```sh
tcpdump dst 1.0.0.1

```
### Finding Packets by Network
    
```sh
tcpdump net 1.2.3.0/24

```
#### Low Output: 

```sh
tcpdump -nnvvS

```
#### Medium Output: 

```sh
tcpdump -nnvvXS

```
#### Heavy Output:

```sh
tcpdump -nnvvXSs 1514


# Getting Creative

* Expressions are very nice, but the real magic of tcpdump comes from the ability to combine them in creative ways in order to isolate exactly what you’re looking for. 

## There are three ways to do combination:

```
### AND

    and or &&

```
### OR

    or or ||

```
### EXCEPT
    
    not or !

# Usage Example: 

```
### Traffic that’s from 192.168.1.1 AND destined for ports 3389 or 22
    
```sh
tcpdump 'src 192.168.1.1 and (dst port 3389 or 22)'


# Advanced 

```
### Show me all URG packets:
    
```sh
tcpdump 'tcp[13] & 32 != 0'

```
### Show me all ACK packets:

```sh
tcpdump 'tcp[13] & 16 != 0'

```
### Show me all PSH packets:
    
```sh
tcpdump 'tcp[13] & 8 != 0'

```
### Show me all RST packets:

```sh
tcpdump 'tcp[13] & 4 != 0'

```
### Show me all SYN packets:

```sh
tcpdump 'tcp[13] & 2 != 0'

```
### Show me all FIN packets:

```sh
tcpdump 'tcp[13] & 1 != 0'

```
### Show me all SYN-ACK packets:
    
```sh
tcpdump 'tcp[13] = 18'

```
### Show all traffic with both SYN and RST flags set: (that should never happen)

```sh
tcpdump 'tcp[13] = 6'

```
### Show all traffic with the “evil bit” set:

```sh
tcpdump 'ip[6] & 128 != 0'

```
### Display all IPv6 Traffic:

```sh
tcpdump ip6

```
### Print Captured Packets in ASCII

```sh
tcpdump -A -i eth0

```
### Display Captured Packets in HEX and ASCII
    
```sh
tcpdump -XX -i eth0

```
### Capture and Save Packets in a File

```sh
tcpdump -w 0001.pcap -i eth0

```
### Read Captured Packets File

```sh
tcpdump -r 0001.pcap

```
### Capture IP address Packets

```sh
tcpdump -n -i eth0

```
### Capture only TCP Packets.

```sh
tcpdump -i eth0 tcp

```
### Capture Packet from Specific Port

```sh
tcpdump -i eth0 port 22

```
### Capture Packets from source IP
    
```sh
tcpdump -i eth0 src 192.168.0.2

```
### Capture Packets from destination IP

```sh
tcpdump -i eth0 dst 50.116.66.139

```
### Capture any packed coming from x.x.x.x

```sh
tcpdump -n src host x.x.x.x

```
### Capture any packet coming from or going to x.x.x.x
    
```sh
tcpdump -n host x.x.x.x

```
### Capture any packet going to x.x.x.x

```sh
tcpdump -n dst host x.x.x.x

```
### Capture any packed coming from x.x.x.x
    
```sh
tcpdump -n src host x.x.x.x

```
### Capture any packet going to network x.x.x.0/24

```sh
tcpdump -n dst net x.x.x.0/24

```
### Capture any packet coming from network x.x.x.0/24

```sh
tcpdump -n src net x.x.x.0/24

```
### Capture any packet with destination port x

```sh
tcpdump -n dst port x

```
### Capture any packet coming from port x
    
```sh
tcpdump -n src port x

```
### Capture any packets from or to port range x to y

```sh
tcpdump -n dst(or src) portrange x-y

```
### Capture any tcp or udp port range x to y

```sh
tcpdump -n tcp(or udp) dst(or src) portrange x-y

```
### Capture any packets with dst ip x.x.x.x and port y
    
```sh
tcpdump -n "dst host x.x.x.x and dst port y"

```
### Capture any packets with dst ip x.x.x.x and dst ports x, z

```sh
tcpdump -n "dst host x.x.x.x and (dst port x or dst port z)"

```
### Capture ICMP , ARP

```sh
tcpdump -v icmp(or arp)

```
### Capture packets on interface eth0 and dump to cap.txt file

```sh
tcpdump -i eth0 -w cap.txt

```
### Get Packet Contents with Hex Output

```sh
tcpdump -c 1 -X icmp

```
### Show Traffic Related to a Specific Port
    
```sh
tcpdump port 3389 
```sh
tcpdump src port 1025

```
### Show Traffic of One Protocol
    
```sh
tcpdump icmp

```
### Find Traffic by IP

```sh
tcpdump host 1.1.1.1

```
### Filtering by Source and/or Destination

```sh
tcpdump src 1.1.1.1 
```sh
tcpdump dst 1.0.0.1

```
### Finding Packets by Network
    
```sh
tcpdump net 1.2.3.0/24


```
### Get Packet Contents with Hex Output
   
```sh
tcpdump -c 1 -X icmp

```
### Show Traffic Related to a Specific Port

```sh
tcpdump port 3389 
```sh
tcpdump src port 1025

```
### Show Traffic of One Protocol

```sh
tcpdump icmp

```
### Show only IP6 Traffic

```sh
tcpdump ip6

```
### Find Traffic Using Port Ranges

```sh
tcpdump portrange 21-23

```
### Find Traffic Based on Packet Size
```sh
     tcpdump less 32 
     tcpdump greater 64 
     tcpdump <= 128
     tcpdump => 128

```
### Reading / Writing Captures to a File (pcap)
    
```sh
tcpdump port 80 -w capture_file
```sh
tcpdump -r capture_file
```
### Raw Output View

```sh
tcpdump -ttnnvvS
```
### From specific IP and destined for a specific Port

```sh
tcpdump -nnvvS src 10.5.2.3 and dst port 3389
```

### From One Network to Another

```sh
tcpdump -nvX src net 192.168.0.0/16 and dst net 10.0.0.0/8 or 172.16.0.0/16

```
### Non ICMP Traffic Going to a Specific IP
    
```sh
tcpdump dst 192.168.0.2 and src net and not icmp

```
### Traffic From a Host That Isn’t on a Specific Port
    
```sh
tcpdump -vv src mars and not dst port 22

```
### Isolate TCP RST flags.

```sh
tcpdump 'tcp[13] & 4!=0'
```
```sh
tcpdump 'tcp[tcpflags] == tcp-rst'

```
### Isolate TCP SYN flags.

```sh
tcpdump 'tcp[13] & 2!=0'
```
```sh
tcpdump 'tcp[tcpflags] == tcp-syn'

```
### Isolate packets that have both the SYN and ACK flags set.

```sh
tcpdump 'tcp[13]=18'

```
### Isolate TCP URG flags.

```sh
tcpdump 'tcp[13] & 32!=0'
```sh
tcpdump 'tcp[tcpflags] == tcp-urg'

```
### Isolate TCP ACK flags.

```sh
tcpdump 'tcp[13] & 16!=0'
```
```sh
tcpdump 'tcp[tcpflags] == tcp-ack'

```
### Isolate TCP PSH flags.

```sh
tcpdump 'tcp[13] & 8!=0'
```sh
tcpdump 'tcp[tcpflags] == tcp-psh'

```
### Isolate TCP FIN flags.

```sh
tcpdump 'tcp[13] & 1!=0'
```
```sh
tcpdump 'tcp[tcpflags] == tcp-fin'
```
# Commands that I using almost daily

```
### Both SYN and RST Set

```sh
tcpdump 'tcp[13] = 6'

```
### Find HTTP User Agents

```sh
tcpdump -vvAls0 | grep 'User-Agent:'
```sh
tcpdump -nn -A -s1500 -l | grep "User-Agent:"

```
### By using egrep and multiple matches we can get the User Agent and the Host (or any other header) from the request.
    
```sh
tcpdump -nn -A -s1500 -l | egrep -i 'User-Agent:|Host:'

```
### Capture only HTTP GET and POST packets only packets that match GET.
```sh
tcpdump -s 0 -A -vv 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420'
```
```sh
tcpdump -s 0 -A -vv 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x504f5354'

```
### Extract HTTP Request URL's
    
```sh
tcpdump -s 0 -v -n -l | egrep -i "POST /|GET /|Host:"

```
### Extract HTTP Passwords in POST Requests
    
```sh
tcpdump -s 0 -A -n -l | egrep -i "POST /|pwd=|passwd=|password=|Host:"

```
### Capture Cookies from Server and from Client
    
```sh
tcpdump -nn -A -s0 -l | egrep -i 'Set-Cookie|Host:|Cookie:'

```
### Capture all ICMP packets
    
```sh
tcpdump -n icmp

```
### Show ICMP Packets that are not ECHO/REPLY (standard ping)
    
```sh
tcpdump 'icmp[icmptype] != icmp-echo and icmp[icmptype] != icmp-echoreply'

```
### Capture SMTP / POP3 Email
    
```sh
tcpdump -nn -l port 25 | grep -i 'MAIL FROM\|RCPT TO'

```
### Troubleshooting NTP Query and Response
    
```sh
tcpdump dst port 123

```
### Capture FTP Credentials and Commands
    
```sh
tcpdump -nn -v port ftp or ftp-data

```
### Rotate Capture Files
    
```sh
tcpdump  -w /tmp/capture-%H.pcap -G 3600 -C 200

```
### Capture IPv6 Traffic
    
```sh
tcpdump -nn ip6 proto 6

```
### IPv6 with UDP and reading from a previously saved capture file.
    
```sh
tcpdump -nr ipv6-test.pcap ip6 proto 17

```
### Detect Port Scan in Network Traffic
    
```sh
tcpdump -nn

# USAGE EXAMPLE

```
### Example Filter Showing Nmap NSE Script Testing
  
* On Target: 

      nmap -p 80 --script=http-enum.nse targetip

* On Server:  

      tcpdump -nn port 80 | grep "GET /"
        
           GET /w3perl/ HTTP/1.1
           GET /w-agora/ HTTP/1.1
           GET /way-board/ HTTP/1.1
           GET /web800fo/ HTTP/1.1
           GET /webaccess/ HTTP/1.1
           GET /webadmin/ HTTP/1.1
           GET /webAdmin/ HTTP/1.1

```
### Capture Start and End Packets of every non-local host
    
```sh
tcpdump 'tcp[tcpflags] & (tcp-syn|tcp-fin) != 0 and not src and dst net localnet'

```
### Capture DNS Request and Response
    
```sh
tcpdump -i wlp58s0 -s0 port 53

```
### Capture HTTP data packets
    
```sh
tcpdump 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'

```
### Capture with tcpdump and view in Wireshark
    
    ssh wuseman@localhost 'tcpdump -s0 -c 1000 -nn -w - not port 22' | wireshark -k -i -

```
### Top Hosts by Packets
    
```sh
tcpdump -nnn -t -c 200 | cut -f 1,2,3,4 -d '.' | sort | uniq -c | sort -nr | head -n 20

```
### Capture all the plaintext passwords
    
```sh
tcpdump port http or port ftp or port smtp or port imap or port pop3 or port telnet -l -A | egrep -i -B5 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|username:|password:|login:|pass |user '

```sh
tcpdump port http or port ftp or port smtp or port imap or port pop3 or port telnet -lA | egrep -i -B5 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd= |password=|pass:|user:|username:|password:|login:|pass |user '

```
### DHCP Example

```sh
tcpdump -v -n port 67 or 68

```
### Cleartext GET Requests

```sh
tcpdump -vvAls0 | grep 'GET'

```
### Find HTTP Host Headers

```sh
tcpdump -vvAls0 | grep 'Host:'

```
### Find HTTP Cookies

```sh
tcpdump -vvAls0 | grep 'Set-Cookie|Host:|Cookie:'

```
### Find SSH Connections
    
```sh
tcpdump 'tcp[(tcp[12]>>2):4] = 0x5353482D'

```
### Find DNS Traffic
    
```sh
tcpdump -vvAs0 port 53

```
### Find FTP Traffic
    
```sh
tcpdump -vvAs0 port ftp or ftp-data

```
### Find NTP Traffic
    
```sh
tcpdump -vvAs0 port 123

```
### Capture SMTP / POP3 Email
```sh
tcpdump -nn -l port 25 | grep -i 'MAIL FROM\|RCPT TO'

```
### Line Buffered Mode

```sh
tcpdump -i eth0 -s0 -l port 80 | grep 'Server:'

```
### Find traffic with evil bit

```sh
tcpdump 'ip[6] & 128 != 0'

```
### Filter on protocol (ICMP) and protocol-specific fields (ICMP type)

tcpdump -n icmp and 'icmp[0] != 8 and icmp[0] != 0'

```
### Same command can be used with predefined header field offset (icmptype) and ICMP type field values (icmp-echo and icmp-echoreply):

```sh
tcpdump -n icmp and icmp[icmptype] != icmp-echo and icmp[icmptype] != icmp-echoreply

```
### Filter on TOS field

```sh
tcpdump -v -n ip and ip[1]!=0

```
### Filter on TTL field

```sh
tcpdump -v ip and 'ip[8]<2'

```
### Filter on TCP flags (SYN/ACK)

```sh
tcpdump -n tcp and port 80 and 'tcp[tcpflags] & tcp-syn == tcp-syn'

```
### In the example above, all packets with TCP SYN flag set are captured. Other flags (ACK, for example) might be set also. Packets which have only TCP SYN flags set, can be captured 

```sh
tcpdump tcp and port 80 and 'tcp[tcpflags] == tcp-syn'

```
### Catch TCP SYN/ACK packets (typically, responses from servers):

```sh
tcpdump -n tcp and 'tcp[tcpflags] & (tcp-syn|tcp-ack) == (tcp-syn|tcp-ack)'
```sh
tcpdump -n tcp and 'tcp[tcpflags] & tcp-syn == tcp-syn' and 'tcp[tcpflags] & tcp-ack == tcp-ack'

```
### Catch ARP packets

```sh
tcpdump -vv -e -nn ether proto 0x0806

```
### Filter on IP packet length

```sh
tcpdump -l icmp and '(ip[2:2]>50)' -w - |tcpdump -r - -v ip and '(ip[2:2]<60)'

```
### Remark: due to some bug in tcpdump, the following command doesn't catch packets as expected:

```sh
tcpdump -v -n icmp and '(ip[2:2]>50)' and '(ip[2:2]<60)'

```
### Filter on encapsulated content (ICMP within PPPoE)

```sh
tcpdump -v -n icmp

```
### Queiter

```sh
tcpdump -q -i eth0
```sh
tcpdump -t -i eth0
```sh
tcpdump -A -n -q -i eth0 'port 80'
```sh
tcpdump -A -n -q -t -i eth0 'port 80'

```
### Print only useful packets from the HTTP traffic
 
```sh
tcpdump -A -s 0 -q -t -i eth0 'port 80 and ( ((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12:2]&0xf0)>>2)) != 0)'

```
### Dump SIP Traffic

```sh
tcpdump -nq -s 0 -A -vvv port 5060 and host 1.2.3.4

```
### Checking packet content

```sh
tcpdump -i any -c10 -nn -A port 80

```
### Checking packet content

    sudo tcpdump -i any -c10 -nn -A port 80

```
### Using tcpdump with port ranges and file count/size

    sudo /usr/sbin/tcpdump -i any -s 0 -n -Z <user_name> -C 500 -W 100 -w /home/<user_name>/$(hostname).pcap -f '(port (# or # or # or # or # or # or ...) or portrange <start>-<end>)' &>/dev/null



## References & Awesome wikis

* https://hackertarget.com/tcpdump-examples/

* https://wiki.geant.org/display/public/EK/TcpdumpExamples

* http://edoceo.com/cli/tcpdump

* https://www.thegeekstuff.com/2010/08/tcpdump-command-examples/

* https://opensource.com/article/18/10/introduction-tcpdump

* https://programming.vip/docs/tcpdump-and-some-default-ports-of-linux.html

* https://www.hackingarticles.in/comprehensive-guide-to-tcpdump-part-1/

* https://www.hackingarticles.in/comprehensive-guide-to-tcpdump-part-2/

* https://www.blackhat.com/docs/us-17/thursday/us-17-Tsai-A-New-Era-Of-SSRF-Exploiting-URL-Parser-In-Trending-Programming-Languages.pdf

* https://sectools.org/tool/tcpdump/


