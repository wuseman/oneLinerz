# apt

### Grep output from apt

```sh     
apt-cache -qq search apache2 |awk 'BEGIN{IGNORECASE=0} /php$|mysql|security2/ {print $0}'
```

```sh
apt-cache search apache2 | grep -Ei "(php|mysql|security2) "   
```

```sh
apt-cache search apache2 |grep -o -Ei "^[^[:space:]]+(php|mysql|security2)[[:space:]]"
```

```sh
apt-cache search apache2|awk '/^[^[:space:]]+(php|mysql|security2)[[:space:]]/ {print $1}'
```

```sh
apt-cache search apache2|awk '/^[^[:space:]]+(php|mysql|security2)[[:space:]]/ {print $1}'
```

### Learn how to stop mistyping "ls" the fun way

```sh      
apt-get install sl; sl
```

### Show a Package Version on Debian based distribution
```sh      
apt-show-versions <packagename>
```

### know which version of the program is installed on your Debian and derivatives
```sh      
aptitude show $PROGRAM | grep Vers
```

### Find packages on Ubuntu/Debian based on their description
```sh      
aptitude search ~d<string>
```

### Bulk install
```sh      
apt-cache search perl | grep module | awk '{print $1;}' | xargs sudo apt-get install -y
```

### Determine MythTV Version on a Debian System
```sh      
apt-cache policy mythtv
```


### Show the meta information on a package (dependency , statuts ..) on debian derivative distro
```sh      
apt-cache show Your_package
```


### Remove unused libs/packages in debian-based distros
```sh      
apt-get remove `deborphan`
```

### Lists installed kernels
```sh      
aptitude search \~ilinux-image
```

### Show the meta information on a package (dependency , statuts ..) on debian derivative distro
```sh      
aptitude show packages_name
```


### Refined repository search
```sh      
apt-get search something | grep specific
```

### Search for available software on a debian package system (Ubuntu)
```sh      
aptitude search NAME
```

### Have you mooed today?
```sh      
apt-get moo
```

### Search for APT Packages
```sh      
apt-cache search php5
```

### Remove all unused kernels with apt-get

```sh      
aptitude remove $(dpkg -l|awk '/^ii  linux-image-2/{print $2}'|sed 's/linux-image-//'|awk -v v=`uname -r` 'v>$0'|sed 's/-generic//'|awk '{printf("linux-headers-%s\nlinux-headers-%s-generic\nlinux-image-%s-generic\n",$0,$0,$0)}')
```

### Generate a graph of package dependencies
```sh      
apt-cache dotty apache2 | dot -T png | display
```

### search ubuntu packages to find which package contains the executable program programname
```sh      
apt-file find bin/programname
```

### ubuntu easter eggs
```sh      
apt-get moo
```

### aptitude easter eggs

```sh      
aptitude moo
```

### Colorful man
```sh      
apt-get install most && update-alternatives set pager /usr/bin/most
```

### Show Apt/Dpkg configuration
```sh      
apt-config dump
```

### Find the package a command belongs to on debian-based distros
```sh      
apt-file search iostat
```

### Search for packages, ranked by popularity
```sh      
apt-popcon() { (echo \#rank; apt-cache search "$@" |awk '$1 !~ /^lib/ {print " "$1" "}') |grep -Ff- <(wget -qqO- http://popcon.debian.org/by_inst.gz |gunzip); }
```

### How to know the total number of packages available
```sh      
apt-cache stats
```

### Bulk install
```sh      
aptitude install '?and(~nlib.*perl, ~Dmodule)'
```

### List available upgrades from apt without upgrading the system

```sh      
apt-get just-print upgrade
```

### Create package dependency graph
```sh      
apt-cache dotty PKG-NAME | dot -Tpng | display
```

### Show a Package Version on Debian based distribution
```sh      
apt-cache show pkgname | grep -i "version:"
```

### Enable programmable bash completion in debian lenny
```sh      
aptitude install bash-completion ; source /etc/bash_completion
```

### Purge configuration files of removed packages on  debian based systems

```sh      
aptitude purge '~c'
```

### List manually installed packages (excluding Essentials)
```sh      
aptitude search '~i!~E' | grep -v "i A" | cut -d " " -f 4
```

### Deploy git server repo
```sh      
apt-get -y install git-core gitosis; adduser home /home/git gecos "git user" git; su git -c "ssh-keygen -t rsa -f /home/git/.ssh/id_rsa; gitosis-init < ~/.ssh/id_rsa"
```

### Remove all unused kernels with aptitude
```sh     
aptitude remove ?and(~i~nlinux-(im|he) ?not(~n`uname -r`))
```

### Cancel all aptitude scheduled actions
```sh      
aptitude keep-all
```

### Shows all packages installed that are recommended by other packages
```sh      
aptitude search '?and( ?automatic(?reverse-recommends(?installed)), ?not(?automatic(?reverse-depends(?installed))) )'
```

### Remove specific versions of old kernels (Ubuntu/Debian)

```sh      
apt purge linux*{14..18}*
```

### print the name of each package APT knows [matching a prefix]
```sh      
apt-cache pkgnames linux-
```

### Aptitude pattern match

```sh      
aptitude purge remove ~i^foo ~i^bar
```

### List upgrade-able packages on Ubuntu

```sh      
apt-get ignore-hold allow-unauthenticated -s dist-upgrade | grep ^Inst | cut -d ' ' -f2
```


### "Clone" a list of installed packages from one Debian/Ubuntu Server to another
```sh      
apt-get install `ssh root@host_you_want_to_clone "dpkg -l | grep ii" | awk '{print $2}'`
```

### Purge configuration file of all desinstalled package
```sh      
aptitude purge ~c
```

### Purge configuration file of all desinstalled package

```sh      
aptitude purge ~c
```

### List available upgrades from apt without upgrading the system
```
```sh      
apt list upgradable
```

### Generate a list of installed packages on Debian-based systems
```sh      
aptitude search ~i -F %p
```

### AllInOne package maintainance
```sh      
apt-get update && apt-get dist-upgrade -y show-progress && apt-get autoremove -y && apt-get check && apt-get autoclean -y
```


### Removes all packages recommended by other packages
```sh      
aptitude remove '?and( ?automatic(?reverse-recommends(?installed)), ?not(?automatic(?reverse-depends(?installed))) )'
```

### Seach for packages on Debian using regex.
```sh      
aptitude search ^tin
```

### Remove unused libs/packages
```sh      
aptitude remove $(deborphan)
```

### Install evertything with the prefix pidgin or wathever
```sh      
apt-cache search pidgin* | awk '{print$ 1}' | tr '\n' ' ' | xargs aptitude -y install
```

### Install phpmyadmin in Debian 6
```sh      
apt-get install phpmyadmin; echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf; service apache2 restart
```

### repository search
```sh      
aptitude search ~d "irc client"|grep -i "irc client"
```

### Show a Package Version on Debian based distribution
```sh      
aptitude -F '%p %v#' search <pattern>
```

### Quick and dirty list of installed packages on deb based system
```sh      
apt-cache -n dumpavail | grep 'Package:' | awk '{print $2 }'
```

### Atualizar Ubuntu
```sh      
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
```

### Check the package is installed or not. There will show the package name which is installed.
```sh      
apt-show-versions | grep '\bpython\b'
```

### Show package dependencies with apt

```sh      
apt-cache depends <packagename>
```

### Show package reverse dependencies with apt
```sh      
apt-cache rdepends <packagename>
```

### Marks all manually installed deb packages as automatically installed.
```sh      
aptitude -F "%p" search \!~M~i~T | xargs apt-mark markauto
```

### Print sorted list of all installed packages (Debian)
```sh      
aptitude search -F "%p" disable-columns ~i
```

### Search packages beginning with the letter
```sh      
aptitude search ~n^s.*
```

### Purge all broken packages on ubuntu
```sh      
aptitude purge $(dpkg -l|grep ^rc|awk '{ print $2 }')
```

### Displays all available firmware you can get (non-free) in a Debian system
```sh      
apt-file package-only search /lib/firmware
```

### Displays all installed firmware in your Debian sytem
```sh      
aptitude search ~i ~nfirmware
```


### Remove all unused kernels with apt-get

```sh      
aptitude remove $(dpkg -l|awk '/^ii  linux-image-2/{print $2}'|sed 's/linux-image-//'|awk -v v=`uname -r` 'v>$0'|sed 's/-generic//'|awk '{printf("linux-headers-%s\nlinux-headers-%s-generic\nlinux-image-%s-generic\n",$0,$0,$0)}')
```

### Generate a graph of package dependencies
```sh      
apt-cache dotty apache2 | dot -T png | display
```

### search ubuntu packages to find which package contains the executable program programname
```sh      
apt-file find bin/programname
```

### ubuntu easter eggs
```sh      
apt-get moo
```

### Colorful man
```sh      
apt-get install most && update-alternatives set pager /usr/bin/most
```

### Show Apt/Dpkg configuration
```sh      
apt-config dump
```

### Find the package a command belongs to on debian-based distros
```sh      
apt-file search iostat
```

### Search for packages, ranked by popularity

```sh      
apt-popcon() { (echo \#rank; apt-cache search "$@" |awk '$1 !~ /^lib/ {print " "$1" "}') |grep -Ff- <(wget -qqO- http://popcon.debian.org/by_inst.gz |gunzip); }
```

### How to know the total number of packages available
```sh      
apt-cache stats
```

### Bulk install
```sh      
aptitude install '?and(~nlib.*perl, ~Dmodule)'
```

### List available upgrades from apt without upgrading the system

```sh      
apt-get just-print upgrade
```

### Create package dependency graph
```sh      
apt-cache dotty PKG-NAME | dot -Tpng | display
```

### Show a Package Version on Debian based distribution
```sh      
apt-cache show pkgname | grep -i "version:"
```

### Enable programmable bash completion in debian lenny
```sh      
aptitude install bash-completion ; source /etc/bash_completion
```

### Purge configuration files of removed packages on  debian based systems
```sh      
aptitude purge '~c'
```

### List total available upgrades from  apt without upgrading the system

```sh      
apt-get -s upgrade | awk '/[0-9]+ upgraded,/ {print $1 " package updates are available"}'
```

### List manually installed packages (excluding Essentials)
```sh      
aptitude search '~i!~E' | grep -v "i A" | cut -d " " -f 4
```

### Deploy git server repo
```sh      
apt-get -y install git-core gitosis; adduser home /home/git gecos "git user" git; su git -c "ssh-keygen -t rsa -f /home/git/.ssh/id_rsa; gitosis-init < ~/.ssh/id_rsa"
```

### Remove all unused kernels with apt
```
```sh      
aptitude remove ?and(~i~nlinux-(im|he) ?not(~n`uname -r`))
```

### Cancel all aptitude scheduled actions
```sh      
aptitude keep-all
```

### Shows all packages installed that are recommended by other packages
```sh      
aptitude search '?and( ?automatic(?reverse-recommends(?installed)), ?not(?automatic(?reverse-depends(?installed))) )'
```

### Remove specific versions of old kernels (Ubuntu/Debian)
```sh      
apt purge linux*{14..18}*
```

### List available upgrades from apt
```sh      
apt (package names only)
```

### print the name of each package APT knows [matching a prefix]
```sh      
apt-cache pkgnames linux-
```

### Locating packages held back, such as with "aptitude hold <package>"

```sh      
aptitude search ~ahold
```

### Aptitude pattern match
  
```sh      
aptitude purge remove ~i^foo ~i^bar
```

### List upgrade-able packages on Ubuntu
```sh      
apt-get ignore-hold allow-unauthenticated -s dist-upgrade | grep ^Inst | cut -d ' ' -f2
```

### "Clone" a list of installed packages from one Debian/Ubuntu Server to another
```sh      
apt-get install `ssh root@host_you_want_to_clone "dpkg -l | grep ii" | awk '{print $2}'`
```

### Purge configuration file of all desinstalled package
```sh      
aptitude purge ~c
```

### Purge configuration file of all desinstalled package
```sh      
aptitude purge ~c
```

### List available upgrades from apt without upgrading the system
```sh      
apt list upgradable
```

### Generate a list of installed packages on Debian-based systems
```sh      
aptitude search ~i -F %p
```

### AllInOne package maintainance
```sh      
apt-get update && apt-get dist-upgrade -y show-progress && apt-get autoremove -y && apt-get check && apt-get autoclean -y
```

### search package descriptions (apt)
  ```sh      
apt-cache search someregex
```

### Removes all packages recommended by other packages
```sh      
aptitude remove '?and( ?automatic(?reverse-recommends(?installed)), ?not(?automatic(?reverse-depends(?installed))) )'
```

### Seach for packages on Debian using regex.
```sh      
aptitude search ^tin
```

### Remove unused libs/packages
```sh      
aptitude remove $(deborphan)
```

### Install evertything with the prefix pidgin or wathever
```sh      
apt-cache search pidgin* | awk '{print$ 1}' | tr '\n' ' ' | xargs aptitude -y install
```

### Install phpmyadmin in Debian 6
```sh      
apt-get install phpmyadmin; echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf; service apache2 restart
```

### Repository search
```sh      
aptitude search ~d "irc client"|grep -i "irc client"
```

### Show a Package Version on Debian based distribution
```sh      
aptitude -F '%p %v#' search <pattern>
```

### Quick and dirty list of installed packages on deb based system
```sh      
apt-cache -n dumpavail | grep 'Package:' | awk '{print $2 }'
```

### Atualizar Ubuntu
```sh      
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
```

### Check the package is installed or not. There will show the package name which is installed.
```sh      
apt-show-versions | grep '\bpython\b'
```

### Marks all manually installed deb packages as automatically installed.
```sh      
aptitude -F "%p" search \!~M~i~T | xargs apt-mark markauto
```

### Print sorted list of all installed packages (Debian)
```sh      
aptitude search -F "%p" disable-columns ~i
```
