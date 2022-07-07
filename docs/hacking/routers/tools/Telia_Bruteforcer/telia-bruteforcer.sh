#!/bin/sh

# iNFO -----------------------------------------------------------------------------
#
#        Author: wuseman <wuseman@nr1.nu>
#      FileName: technicolor-fuzzer.sh
#       Version: 1.0
#
#       Created: 2021-12-02 (00:37:00)
#      Modified: 2021-12-04 (03:17:43)
#
#           iRC: wuseman (Libera/EFnet/LinkNet) 
#       Website: https://www.nr1.nu/
#        GitHub: https://github.com/wuseman/
#
# - Descrpiption --------------------------------------------------------------------
#
#      Bruteforcer OR Fuzzer (you can choose) for find firmwares from Telias 
#      server, this script gonna work for all technicolor sources you just need
#      need to edit the info under settings..
#
#      Have fun!
#
# - Notice --------------------------------------------------------------------------
#
#      This tool has been created for educational purposes.
#      Developers never urge anyone to commit crimes. 
#
#      The developer disclaims all responsibility for other users' use of this script 
#      As soon as the user executed the script the responsibility is on the user.
#
#      If the user does not agree to the above, the user should immediately delete this script.
#
#      // wuseman
#
# - LiCENSE -------------------------------------------------------------------------
#
#      Copyright (C) 2021, wuseman                                     
#                                                                       
#      This program is free software; you can redistribute it and/or modify 
#      it under the terms of the GNU General Public License as published by 
#      the Free Software Foundation; either version 3 of the License, or    
#      (at your option) any later version.                                  
#                                                                       
#      This program is distributed in the hope that it will be useful,      
#      but WITHOUT ANY WARRANTY; without even the implied warranty of       
#      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        
#      GNU General Public License for more details.                         
#                                                                       
#      You must obey the GNU General Public License. If you will modify     
#      the file(s), you may extend this exception to your version           
#      of the file(s), but you are not obligated to do so.  If you do not   
#      wish to do so, delete this exception statement from your version.    
#      If you delete this exception statement from all source files in the  
#      program, then also delete it here.                                   
#
#      You should have received a copy of the GNU General Public License
#      along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# - End of Header -------------------------------------------------------------

# Settings -------------------------------------------------

# Firmware and router model
board="VDNT-O"
firmware="17.2.339-1901024-20180416103700-7e33e895fd9205aade75ccaa3b584310d496ac9e"

# Server info
server_ssl=false
server_ip=131.116.22.230

# File extension on firmware we gonna look for 
file_format="rbi"




# - SOURCE CODE BEGINS HERE ----------------------------------------
banner() {
    cat << "EOF"
__      ___   _ ___  ___ _ __ ___   __ _ _ __                                       
\ \ /\ / / | | / __|/ _ \ '_ ` _ \ / _` | '_ \                        
 \ V  V /| |_| \__ \  __/ | | | | | (_| | | | |                      
  \_/\_/  \__,_|___/\___|_| |_| |_|\__,_|_| |_|                     
      N E X T  G E N E R A T I O N  B R U T E F O R C E R - v1.0    
-----------------------------------------------------------------   
 Bruteforcing & Hacking is fun - Telia, you enjoy my banner? :-)       
-----------------------------------------------------------------   
EOF
}

# - Versions we gonna try (000 999) NOT (0 999)
# firmware_version=$(printf "%03d\n" {0..999})
# firmware_Version=$(seq -w 0 999)

if [[ ${server_ssl} = "false" ]]; then
    remote_ip="http://${server_ip}"
else
    remote_ip="https://${server_ip}"
fi


#### INFO
#  sed 's/...$//' is faster then sed 's/.\{3\}$//' so we use the first one.

bruteforcer() {
    b=$(echo ${board}|awk -F'-' '{print tolower($2)}')
    f=$(echo ${firmware}|sed 's/\.//g'|awk -F'-' '{print $1,$2}'|sed 's/...$//'|sed "s/ /${b}/g")

    for n in $(seq -w 0 999) ; do
        wget --spider ${remote_ip}/${f}${n}closed.${file_format} &> /dev/null; 
        if [[ $? = "0" ]]; then 
            echo -e "[\e[1;32m+\e[0m] -- Firmware Was Found: ${f}${n}closed.${file_format}, downloading..."
            curl -H "TeliaSoneraCompany AB/5.0 (Go Cry!)" ${remote_ip}/${f}${n}closed.${file_format} -o ${path}/${f}${n}closed.${file_format} -o /dev/null -#; 
        fi
        echo -e "[\e[1;31m-\e[0m] -- Firmware Not found: ${f}${n}closed.${file_format}"
    done
}

usage() { 
    cat << "EOF"

    ./telia-bruteforcer.sh usage: 

          -d|--download      | Download firmwares
          -p|--path          | Path to store firmware files

EOF
exit 0 
}


while getopts ":d:p:hd" opt; do
    case ${opt} in
        "d") 
            download=$OPTARG

            ;;
        "h") 
            usage; 
            exit 0
            ;;
        "p") 
            path=$OPTARG
            ;;
        "\?")
            echo "./$basename$0: internal error -- invalid option: -$OPTARG" 1>&2
            exit 1
            ;;

        ":") 
            echo -e "./$basename$0: internal error -- ${OPTARG} require a path to be set.."
            exit 1;
            ;;

        "\*")
            usage
            ;;
    esac
done
shift $((OPTIND -1))

if [[ -z $download ]]; then usage; exit 0; fi
if [[ ! -z $path  ]]; then
    echo -e "./$basename$0: internal error -- you must choose folder"
fi


if ! [[ -d $path ]]; then echo "That is not a valid path..."; fi


#### INFO                                                                                                                                                     
#  sed 's/...$//' is faster then sed 's/.\{3\}$//' so we use the first one.                                                                                   

banner    
b=$(echo ${board}|awk -F'-' '{print tolower($2)}')                                                                                                        
f=$(echo ${firmware}|sed 's/\.//g'|awk -F'-' '{print $1,$2}'|sed 's/...$//'|sed "s/ /${b}/g")                                                             

wget -h|grep -q "\-\-spider" 
if [[ $? -ne "0" ]]; then
    wget="wget -s"
else
    wget="wget --spider"
fi


for n in $(seq -w 0 999) ; do                                                                                                                              
    $wget ${remote_ip}/${f}${n}closed.${file_format} &> /dev/null;                                                                                      
    if [[ $? = "0" ]]; then                                                                                                                               
        echo -e "[\e[1;32m+\e[0m] -- Firmware Was Found: ${f}${n}closed.${file_format}, downloading..."                                           
        curl -H 'TeliaSoneraCompany AB/5.0 (Go Cry!)' ${remote_ip}/${f}${n}closed.${file_format} -o /mnt/usb/USB-A/vdnt-o/firmware/1720339/${f}${n}closed.${file_format} -o /dev/null -#;
    fi                                                                                 
    echo -e "[\e[1;31m-\e[0m] -- Firmware Not found: ${f}${n}closed.${file_format}"
done             
echo -e "[\e[1;38m-\e[0m] --------------------------------------------------------------" 
echo -e "[\e[1;38m-\e[0m] -- End!"
echo -e "[\e[1;37m-\e[0m] --------------------------------------------------------------" 

