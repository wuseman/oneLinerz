# dev and proc

How I read,edit and handle everything in `/proc` will be added here

### Print syslog messages

```bash
cat /proc/sys/kernel/printk
```

### Send Message to `dmesg` with the correct `syntax` for grabbing msg with syslog properly

```bash
echo '<4>Foo: Message' | sudo tee /dev/kmsg
```