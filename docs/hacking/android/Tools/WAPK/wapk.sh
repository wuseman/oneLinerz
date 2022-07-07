#!/bin/bash
####
#### Copyright (C) 2019  wuseman <wuseman@nr1.nu> - All Rights Reserved
#### Created: 2019-02-19
####

usage() {
cat << EOF

wadb-extractor.sh is a tool for facialiate the work with apk files from command-line

   where:
       -c|--compile     | Compile your decrypted package to apk
       -e|--extract     | Extract any apk file
       -h|--help        | Print this help and exit
       -s|--sign        | Sign your compiled apk 

EOF
}


key() {

     if [[ ! -f $HOME/.wapk/wapk.keystore ]]; then
           printf "You must create a key to sign the apk..\n"
           mkdir -p $HOME/.wapk/
           keytool -genkey -v -keystore $HOME/.wapk/wapk.keystore -alias wapk -keyalg RSA -keysize 4096 -validity 10000
     fi
}

extractapk() {
key

    read -p "APK To extract: " apk
    printf "You must provide a real .apk file..\n"
    printf "Extracting $apk, please wait\n"
    apktool d -r -s $apk &> /dev/null
    printf "Extracted $(echo $apk | sed 's/.apk//g') successfully..\n"
}

compressapk() {
read -p "Path to compress: " apkcompress
if [[ -z $apkcompress ]]; then
    printf "You must provide a path name..\n"
else
    printf "Compressing $apkcompress, please wait\n"
apktool b -f -d $apkcompress &> /dev/null
    printf "Compressed $(echo $apkcompress | sed 's/.apk//g') successfully..\n"
    printf "You can sign $apkcompress.apk now.."
fi
mv $apkcompress/dist/*.apk .

}

signapk() {
read -p "APK To Sign: " apksign
printf "Please wait, trying to sign $apksign\n"
   jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $HOME/.wapk/wapk.keystore $apksign wapk
if [[ $? -eq 0 ]]; then
printf "\nSuccessfully signed $apksign\n\n"

  read -p "Do you want to install $apksign (y/n): " installapk
if [[ $installapk = "y" ]]; then
   echo "Please wait, installing $apksign\n" 
   adb install $installapk
   printf "Successfully installed $installapk\n"
   exit
else
   sleep 0 
fi
fi
}


key


if [[ -z $1 ]]; then
usage
fi

if [[ $1 = "-e" ]]; then
    extractapk
fi

if [[ $1 = "-c" ]]; then
    compressapk
fi

if [[ $1 = "-s" ]]; then
    signapk
fi
