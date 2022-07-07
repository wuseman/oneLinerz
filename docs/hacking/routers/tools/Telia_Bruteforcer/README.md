# Telia Bruteforcer

- In action.

![telia-bruteforcer](https://user-images.githubusercontent.com/26827453/177019827-449f7ab1-f5c6-4117-9114-2350b3558b7f.gif)

- It is really simple to get started, this tool should work for other ISPS too that hosting rbi files and other firmware files

![telia_bruteforcer_howto](https://user-images.githubusercontent.com/26827453/177019825-06cb4d1f-709b-4515-96b5-9c96134ad69d.gif)

### How To Getting Started:

```sh
git clone git://github.com/wuseman/telia-bruteforcer.git
cd telia-bruteforcer
```

- Open telia-bruteforcer.sh, change the field below:
 
```sh
board="VDNT-O" 
firmware="17.2.0405-1901068-20201215160859"
server_ssl=false
server_ip=131.116.22.230
file_format="rbi"
```

- When you have edited the file, run the script as below:

```sh
sh ./telia-bruteforcer.sh -d -p /tmp 

    -d|--download      | Download firmwares
    -p|--path          | Path to store firmware files

```

### Notice

     Read the notice header inside telia-bruteforcer.sh before before you are using this script

## Authors:

* **wuseman <wuseman@nr1.nu\>**

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](https://www.nr1.nu/linux/license/) file for details

# End
