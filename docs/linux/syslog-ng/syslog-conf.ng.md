# syslog-ng config 


### Log sshd successes and failures

```sh
filter f_ssh { program(^sshd$); };
destination d_ssh { file("/var/log/ssh.fail" fsync(no)); };
log { source(src); filter(f_ssh); destination(d_ssh); };
```

### Filter by programlist

```sh
filter f_whitelist { in-list("/etc/syslog-ng/programlist.list", value("PROGRAM")); };
    log {
        source(src);
        filter(f_whitelist);
        destination(d_remote); };
```

### IPtables

The assumption in this example is that the LOGCHAIN chain is part of a larger ruleset that routes traffic to it. 
Whenever the syslog-ng OSE created rule is there, packets can flow, otherwise the port is closed.

```sh
source {
    network(transport(udp)
        hook-commands(
            startup("iptables -I LOGCHAIN 1 -p udp --dport 514 -j ACCEPT")
            shutdown("iptables -D LOGCHAIN 1")
  )
 );
};
```