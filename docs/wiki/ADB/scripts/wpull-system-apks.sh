#!/bin/bash

# - iNFO -----------------------------------------------------------------------------
#
#        Author: wuseman <wuseman@nr1.nu>
#      FileName: wpull.sh
#       Version: 1.0
#
#       Created: 2021-09-14 (18:51:48)
#      Modified: 2021-10-15 (02:22:31)
#
#           iRC: wuseman (Libera/EFnet/LinkNet) 
#       Website: https://www.nr1.nu/
#        GitHub: https://github.com/wuseman/
#
# - Descrpiption --------------------------------------------------------------------
#
#      No description has been added
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

line='..............................................'
printf "Please enter path to store the apk files in, path: "; read storagepath
echo ""
mkdir -p $storagepath
cd $storagepath
printf "%61s\n" | tr ' ' '='
printf "Pulling applications installed from playstore..........[\e[0;33mWAIT\e[0m]\n"
printf "%61s\n" | tr ' ' '='

for package in $(adb shell pm list packages -s| tr -d '\r' | sed 's/package://g'); do
    apk=$(adb shell pm path $package | tr -d '\r' | sed 's/package://g' | cut -d\/ -f4|cut -d- -f1)
    apk_real=$(adb shell pm path $package | tr -d '\r' | sed 's/package://g')
    printf "Pulling: $apk";
    adb pull -p $apk_real "$package".apk &> /dev/null
    printf "%s%s[\e[1;32mDONE\e[0m]\n" "${line:${#apk}}"
done
PCKS="$(adb shell pm list packages -s| tr -d '\r' | sed 's/package://g' | wc -l)"
printf "%61s\n" | tr ' ' '='
printf "Pulled $PCKS apk packages from your device................[\e[1;32mDONE\e[0m]\n"
printf "%61s\n" | tr ' ' '='
exit

