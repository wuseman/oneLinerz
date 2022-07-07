# gentoo-vmware

![Screenshot](https://wuseman.nr1.nu/archive/gentoo_stuff/vmware_screenshot.png)

# From vmware > qcow2
The only file we care about though is the *.vmdk file as that is the one with the actual image

We will be converting the vmdk to qcow2, really simple:

```sh
tar -xvf original.ova
qemu-img convert -O qcow2 win10.vmdk win10.qcow2
qemu-system-x86_64 -enable-kvm -cpu host  -smp 4  -device usb-ehci,id=ehci -device qemu-xhci,id=xhci -device usb-tablet,bus=xhci.0 -net nic  -net user -m 4192 -cdrom win10.qcow2
```

And vice versa, qcow2 into a vmware vmdk file:

```sh
qemu-img convert -f qcow2 -O vmdk windows.11.qcow2 windows.11.vmdk
```

How to import the vmdk into vmware-workstation you should know if you went this far

It's amazing, I love virtual machines :) 

# Nowadays (Releases from ~2020>)
This has been a really tricky thing to get installed on Gentoo back in the days but last year it have become really easy

Install the vmware bundle file by ./vmware-vxxx.bundle

Once done, setup everything and when you will power up the guest machine it probably will cry over for vmmon and vmnet is not enabled in kernel config.
Since recently ou wont find any settings in /usr/src/linux/.config for this, instead, execute below command for get everything installed:

	vmware-modconfig --console --install-all

Wait until its done and you will have a working vmware workstation setup on your Gentoo Machine:

Starting VMware services:
   Virtual machine monitor                                             done
   Virtual machine communication interface                             done
   VM communication interface socket family                            done
   Virtual ethernet                                                    done
   VMware Authentication Daemon                                        done
   Shared Memory Available                                             done

Full output from the command above is found @ https://pastebin.com/raw/vPfv7u3s

Enjoy vmware, it pwnz with a Legit License! :) 


# Older Releases (Releases from <~2020)
### This is how I got vmware-workstation working on v12.5.9

Once you installed everything and things just hassles for you about modules and shit, it toke ages to figure out below: 

```sh
VMWARE_VERSION=workstation-12.5.9
TMP_FOLDER=/tmp/patch-vmware
rm -fdr $TMP_FOLDER
mkdir -p $TMP_FOLDER
cd $TMP_FOLDER
git clone https://github.com/mkubecek/vmware-host-modules.git
cd $TMP_FOLDER/vmware-host-modules
git checkout $VMWARE_VERSION
git fetch
make
sudo make install
sudo rm /usr/lib/vmware/lib/libz.so.1/libz.so.1
sudo ln -s /lib/x86_64-linux-gnu/libz.so.1 
/usr/lib/vmware/lib/libz.so.1/libz.so.1
```

You will now have a working vmware setup, but ey. Use the latest versions to avoid all the trouble with the above shit.


### Network Stuff

Settings for your NAT and other net configurations is available in:

    /etc/vmware/vmnet8/nat/nat.conf

```sh
/usr/bin/vmnet-bridge -s 12 -d /var/run/vmnet-bridge-0.pid -n 0
/usr/bin/vmnet-netifup -s 12 -d /var/run/vmnet-netifup-vmnet1.pid /dev/vmnet1 vmnet1
/usr/bin/vmnet-dhcpd -s 12 -cf /etc/vmware/vmnet1/dhcpd/dhcpd.conf -lf /etc/vmware/vmnet1/dhcpd/dhcpd.leases -pf /var/run/vmnet-dhcpd-vmnet1.pid vmnet1
/usr/bin/vmnet-natd -s 12 -m /etc/vmware/vmnet8/nat.mac -c /etc/vmware/vmnet8/nat/nat.conf
/usr/bin/vmnet-netifup -s 12 -d /var/run/vmnet-netifup-vmnet8.pid /dev/vmnet8 vmnet8
/usr/bin/vmnet-dhcpd -s 12 -cf /etc/vmware/vmnet8/dhcpd/dhcpd.conf -lf /etc/vmware/vmnet8/dhcpd/dhcpd.leases -pf /var/run/vmnet-dhcpd-vmnet8.pid vmnet8
```

### Fuse mount

```sh
/usr/bin/vmware-fuseUI -s -r 8 -w 11 -p 23019
```

### Launch vmware from cli

```sh
/usr/lib/vmware/bin/vmware-vmx -s vmx.stdio.keep=TRUE -# \
product=1;name=VMware Workstation;version=16.1.1;buildnumber=17801498;licensename=VMware \
Workstation;licenseversion=16.0; -@ duplex=3;msgs=ui \
/path/to/Windows_10_x64_Enterprise/Windows 10 x64 Enterprise.vmx
```
