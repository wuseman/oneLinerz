# Sagemcom F@st 5370e (Telia Sonera AB)

#### This README is on hold until I will get a new router from TELIA since i bought a private router for now, I will probably get a new one this summer so don't expect this repo to get updated in the upcomming weeks. Of course all commands in this wiki is available still if you are on firmware 3.42.2. In firmware 3.43.3 all important settings has been removed so you can't enable telnet and ssh access via the console by the exploits in this wiki anymore. (3.42.3 FIRMWARE UPGRADE WAS SENT TO ALL SAGEMCOM ROUTERS (Models: 5***) WORLD WIDE SO THIS FIRMWARE UPGRADE WAS A GLOBAL ONE .....).

#### This wiki and **all** scripts that will be added under this repo has been made by wuseman and is licensed under GPL Version 3.

##### This is the first wiki online that will help you to bring the power back from Telia and Sagemcom developers via _telnet_.

##### No intrusion on Telia or Sagemcom's servers has occurred and no damage on hardware has been done. It's all about extremely poor security in the firmware.

#### News (2022-01-23) 

Here is new pictures from the date this post was updated:

![Screenshot](https://wuseman.nr1.nu/archive/sagemcom/3.jpg)
![Screenshot](https://wuseman.nr1.nu/archive/sagemcom/2.jpg)
![Screenshot](https://wuseman.nr1.nu/archive/sagemcom/4.jpg)
![Screenshot](https://wuseman.nr1.nu/archive/sagemcom/1.jpg)


![Screenshot](https://nr1.nu/archive/sagemcom-hacking/felia1.jpg)

#### Find hidden settings in latest firmware (3.42.3)

![Screenshot](hidden-settings.gif)

    $.xmo.getValuesTree("*")
    $.xmo.getValuesTree("*/*")
    $.xmo.getValuesTree("*/*/*")
    $.xmo.getValuesTree("*/*/*/*")
    $.xmo.getValuesTree("*/*/*/*/*")
    $.xmo.getValuesTree("*/*/*/*/*/*")
    $.xmo.getValuesTree("*/*/*/*/*/*/*")
    and so on.. 

### For list more things like attributes wich above command wont list, use getCapability instead:

    $.xmo.getCapability("*")
    $.xmo.getCapability("*/*")
    $.xmo.getCapability("*/*/*")
    and so on..

### For list all configurations where you can list allowedUsers, blockedUsers and other configurations:

    $.config
    $.config.allowedUsers
    $.config.modules
    $.config.reinitializeWithFactory
    and so on..

### For list all features that has been disable from default:

     $.config.showedpages

     BoBStatus: {enable: false}
     CPULoadField: {enable: false}
     DHCPv6Server: {enable: false}
     DLNA: {enable: true}
     DTMFTransmissionMode: {enable: false}
     GUIupgrade: {enable: false}
     IAPDEnable: {enable: false}
     MTU: {enable: false}

#### Below is a preview when we have shell access with full root privileges:

![Screenshot](https://nr1.nu/archive/sagemcom-hacking/telia-telnet.gif)

###### As on earlier versions from Telia they added backdoors without customers knowledge: 

![Screenshot](https://nr1.nu/archive/sagemcom-hacking/sagem-backdoor.png)

###### And it's not only Telia that got backdoors on our device, also sagemcom that can use our network and sniff traffic, here is a proof for how to find info about all settings they have configured:

![Screenshot](https://nr1.nu/archive/sagemcom-hacking/sagem-owned2.png)

###### Stop/Start LXC From TelialXC Rootfs:

    lxc-stop -n teliaLxc -F
    lxc-start -n teliaLxc -F

###### UCI Settings:

    uci show network
    uci show dhcp
    uci show system

###### Login as another user:

    var x = $.xmo;
    $.xmo.init();
    $.xmo.login("username", "password");
    $.dosomethingherewithoutloginongui
    
###### Route INFO:

    $.xmo.getValuesTree("Device/Routing/RouteInformation/Enable");
    $.xmo.setValuesTree("true", "Device/Routing/RouteInformation/Enable");

###### Enable ADVANCED Mode:

    $.xmo.getValuesTree("Device/UserInterface/AdvancedMode");
    $.xmo.setValuesTree("true", "Device/UserInterface/AdvancedMode");

###### Set user settings for Administrator/admin/internal:

    $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='1']");
    $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='1']/Role");
    $.xmo.setValuesTree("SuperUser", "Device/UserAccounts/Users/User[@uid='1']/Role");
    $.xmo.setValuesTree("true", "Device/UserAccounts/Users/User[@uid='1']/CurrentlyRemoteAccess");
    $.xmo.setValuesTree("wuseman@nr1.nu", "Device/UserAccounts/Users/User[@uid='1']/Email");
    $.xmo.setValuesTree("Sweden", "Device/UserAccounts/Users/User[@uid='1']/Country");
    $.xmo.setValuesTree("wuseman", "Device/UserAccounts/Users/User[@uid='1']/Lastname");
    $.xmo.setValuesTree("true", "Device/UserAccounts/Users/User[@uid='1']/OwnPass");
    $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='1']/RemoteAccesses/RemoteAccess[@uid='1']");
    $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='2']/RemoteAccesses/RemoteAccess[@uid='1']");
    $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='3']/RemoteAccesses/RemoteAccess[@uid='1']");
    $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='2']/RemoteAccesses/RemoteAccess[@uid='1']");

###### BACKDOORS (DONT PLAY WITH THIS IF YOU DONT KNOW WHAT YOU ARE DOING IT WILL FREEZE ROUTER AND FACTORY RESET IS REQUIRED)

    $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='3']/RemoteAccesses/RemoteAccess[@uid='2']/Enabled"); # SSH FOR TELIA ENABLE BY DEFAULT
    $.xmo.setValuesTree("false", "Device/UserAccounts/Users/User[@uid='3']/RemoteAccesses/RemoteAccess[@uid='3']/Enabled");
    $.xmo.setValuesTree("false", "Device/UserAccounts/Users/User[@uid='3']/RemoteAccesses/RemoteAccess[@uid='4']/Enabled");

###### Response to PING:

    $.xmo.getValuesTree("$.xmo.getValuesTree("Device/Firewall/RespondToPing");");
    $.xmo.setValuesTree("", "");

###### Print/Set DYNDNS Stuff:

    $.xmo.getValuesTree("Device/Services/DynamicDNS/Clients/Client[@uid='1']/Enable");
    $.xmo.getValuesTree("Device/Services/DynamicDNS/Clients/Client[@uid='1']/Status");
    $.xmo.getValuesTree("Device/Services/DynamicDNS/Clients/Client[@uid='1']/Username");
    $.xmo.getValuesTree("Device/Services/DynamicDNS/Clients/Client[@uid='1']/Password");


###### Storageservices GET INFO

    $.xmo.getValuesTree("Device/Services/StorageServices/StorageService[@uid='1']/Capabilities/SFTPCapable");
    $.xmo.getValuesTree("Device/Services/StorageServices/StorageService[@uid='1']/Capabilities/FTPCapable");
    $.xmo.getValuesTree("Device/Services/StorageServices/StorageService[@uid='1']/Capabilities/HTTPWritable");

###### Storageservices SET INFO

    $.xmo.setValuesTree("true", "Device/Services/StorageServices/StorageService[@uid='1']/Capabilities/SFTPCapable");
    $.xmo.setValuesTree("true", "Device/Services/StorageServices/StorageService[@uid='1']/Capabilities/FTPCapable");
    $.xmo.setValuesTree("true", "Device/Services/StorageServices/StorageService[@uid='1']/Capabilities/HTTPWritable");
    $.xmo.setValuesTree("true", "Device/Services/StorageServices/StorageService[@uid='1']/Capabilities/VolumeEncryptionCapable");
    $.xmo.getValuesTree("Device/Services/StorageServices/StorageService[@uid='1']/Capabilities/VolumeEncryptionCapable");
    $.xmo.getValuesTree("Device/Services/StorageServices/StorageService[@uid='1']/Capabilities/SupportedNetworkProtocols");
    $.xmo.getValuesTree("SMB,SSH,TELNET,HTTP", Device/Services/StorageServices/StorageService[@uid='1']/Capabilities/SupportedNetworkProtocols");
    $.xmo.setValuesTree("true", "Device/Services/StorageServices/StorageService[@uid='1']/FTPServer/Enable");
    $.xmo.getValuesTree("Device/Services/StorageServices/StorageService[@uid='1']/FTPServer/Enable");
    $.xmo.getValuesTree("Device/Services/StorageServices/StorageService[@uid='1']/FTPServer/Status");


###### Print IPV4 Addresses:

      $.xmo.getValuesTree("Device/IP/Interfaces/Interface[Alias=\"IP_DATA\"]/IPv4Addresses/IPv4Address[Alias=\"IP_DATA_ADDRESS\"]/IPAddress");
     
###### Print IPV6 Addresses:

      $.xmo.getValuesTree("Device/IP/Interfaces/Interface[@uid='1']/IPv6Addresses/IPv6Address[@uid='1']/IPAddress");

###### Enable Telnet

      $.xmo.setValuesTree("ACCESS_ENABLE_ALL", "Device/UserAccounts/Users/User[@uid='1']/RemoteAccesses/RemoteAccess[@uid='4']/LANRestriction");

###### Enable SSH

      $.xmo.setValuesTree("ACCESS_ENABLE_ALL", "Device/UserAccounts/Users/User[@uid='1']/RemoteAccesses/RemoteAccess[@uid='4']/LANRestriction");

###### Print hardware version:

    $.xmo.getValuesTree("Device/DeviceInfo/HardwareVersion");

###### Remove BLACKLISTED ports:

    $.xmo.setValuesTree("", "Device/Managers/NetworkData/BlacklistedPorts");
    $.xmo.getValuesTree("", "Device/Managers/NetworkData/BlacklistedPorts");

###### Enable SFTP:

    $.xmo.getValuesTree("Device/ServicesStorageService[1]/Enable");
    $.xmo.getValuesTree("Device/Services/StorageServices/StorageService[@uid='1']/Enable");
    $.xmo.setValuesTree('true', "Device/Services/StorageServices/StorageService[@uid='1']/SFTPServer/Enable");

###### Enable FTP:

    $.xmo.getValuesTree("Device/Services/StorageServices/StorageService[@uid='1']/FTPServer");
    $.xmo.setValuesTree("true", "Device/Services/StorageServices/StorageService[@uid='1']/FTPServer/Enable");
    $.xmo.getValuesTree("Device/Services/StorageServices/StorageService[@uid='1']/FTPServer/Enable"); 

###### Edit first connection:

    $.xmo.getValuesTree("Device/DeviceInfo/FirstConnection");

###### Interface: 

    $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Role='WAN']");

###### Print MAC Addr:

    $.xmo.getValuesTree("Device/DeviceInfo/MACAddress");

###### UPNP Stuff:

    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/UPnPMediaServerPort");
    $.xmo.setValuesTree("wusemans home", "Device/UPnP/Settings/UPnPMediaServer/FriendlyName");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/FriendlyName");
    $.xmo.setValuesTree("https://nr1.nu", "Device/UPnP/Settings/UPnPMediaServer/PresentationUrl");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/PresentationUrl");
    $.xmo.setValuesTree("/", "Device/UPnP/Settings/UPnPMediaServer/RootFolder");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/RootFolder");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/UPnPNMCServer");
    $.xmo.setValuesTree("true", "Device/UPnP/Settings/UPnPMediaServer/UPnPNMCServer");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/UploadEnabled");
    $.xmo.setValuesTree("1", "Device/UPnP/Settings/UPnPMediaServer/UploadEnabled");

###### Enable more AccessControl Settings:

    $.xmo.getValuesTree("Device/Managers/NetworkLan/AccessControlEnable");
    $.xmo.setValuesTree('true', "Device/Managers/NetworkLan/AccessControlEnable");
    $.xmo.setValuesTree("true", "Device/Managers/NetworkLan/GuestAccessControlEnable");
$.xmo.getValuesTree("Device/Managers/NetworkLan/GuestAccessControlEnable");


###### Misc

      $.xmo.setValuesTree("true", "Device/UserInterface/AdvancedMode"); # # ENABLE ADVANCED MODE
      $.xmo.getValuesTree("Device/UserInterface/AdvancedMode");  # Confirm advanced mode has been set

###### Syslog Settings

      $.xmo.setValuesTree("192.168.1.104", "Device/DeviceInfo/Logging/Syslog/Server/IPv4Address");
      $.xmo.setValuesTree(".*", "Device/DeviceInfo/Logging/Syslog/Server/SyslogConfig");
      sed -i 's/81.236.57.18/192.168.1.104/g' /etc/syslog-ng/syslog-ng.conf 
      sed -i 's/1.1.1.1/192.168.1.104/g' /telia/lxc/rootfs/etc/syslog-ng/syslog-ng.conf

###### Colors

      $.xmo.setValuesTree("#000000", "Device/UserInterface/BackgroundColor")
      $.xmo.setValuesTree("white", "Device/UserInterface/ButtonTextColor")
      $.xmo.setValuesTree("magenta", "Device/UserInterface/ButtonColor")
      $.xmo.setValuesTree("white", "Device/UserInterface/TextColor")

###### Disable upcomming firmware upgrades:

      # Default "https://acs.telia.com:7575/ACS-server/ACS"
      $.xmo.setValuesTree("", "Device/Managers/NetworkData/MultiVlanUrl");
      $.xmo.setValuesTree("",  "Device/Managers/NetworkData/SingleModeUrl");
      $.xmo.setValuesTree("",  "Device/ManagementServer/ConnectionRequestURL");
      $.xmo.setValuesTree(false", "Device/ManagementServer/PeriodicInformEnable");
      $.xmo.setValuesTree("", "Device/ManagementServer/URL");
      $.xmo.getValuesTree("Device/Managers/NetworkData")

###### Print Serial Number

      $.xmo.getValuesTree("Device/GatewayInfo/SerialNumber");

###### Set/Print hostname/dns

      $.xmo.getValuesTree("Device/DNS/Client/HostName");
      $.xmo.getValuesTree("Device/DNS/Client/LocalDomains");
      $.xmo.setValuesTree("router, "Device/DNS/Client/LocalDomains");
      $.xmo.setValuesTree("router", "Device/DNS/Client/HostName");
      $.xmo.getValuesTree("Device/DNS/Client/Servers[0]/DNSServer")"; # NOT WORK
      $.xmo.getValuesTree("Device/Services/DynamicDNS/Clients/Client[1]/Enable");

###### Print DNS Server IP:s

      $.xmo.getValuesTree("Device/DNS/Client/Servers/Server[1]/DNSServer");
      $.xmo.getValuesTree("Device/DNS/Client/Servers/Server[2]/DNSServer");

###### Print Time & Date status

      $.xmo.getValuesTree("Device/Time/Enable");
      $.xmo.getValuesTree("Device/Time/Status");

###### QOS Settings - (Insane many different ip adresses)

      $.xmo.getValuesTree("Device/QoS/DefaultDSCPMark");

###### USB
      
     $.xmo.getValuesTree("Device/USB/Enable");

###### Print info about interfaces:

     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/BroadcastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/BroadcastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/BytesReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/BytesSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/CurrentBitRate");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Diagnostics/CurrentBitRate");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/DiscardPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/DiscardPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Diagnostics/CurrentDuplexMode");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/ErrorsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/ErrorsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/MulticastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/MulticastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/PacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/PacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Status");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/UnicastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY1"]/Stats/UnicastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/BroadcastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/BroadcastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/BytesReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/BytesSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/CurrentBitRate");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Diagnostics/CurrentBitRate");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/DiscardPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/DiscardPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Diagnostics/CurrentDuplexMode");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/ErrorsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/ErrorsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/MulticastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/MulticastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/PacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/PacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Status");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/UnicastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY2"]/Stats/UnicastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/BroadcastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/BroadcastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/BytesReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/BytesSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/CurrentBitRate");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Diagnostics/CurrentBitRate");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/DiscardPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/DiscardPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Diagnostics/CurrentDuplexMode");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/ErrorsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/ErrorsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/MulticastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/MulticastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/PacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/PacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Status");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/UnicastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY3"]/Stats/UnicastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/BroadcastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/BroadcastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/BytesReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/BytesSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/CurrentBitRate");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Diagnostics/CurrentBitRate");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/DiscardPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/DiscardPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Diagnostics/CurrentDuplexMode");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/ErrorsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/ErrorsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/MulticastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/MulticastPacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/PacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/PacketsSent");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Status");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/UnicastPacketsReceived");
     $.xmo.getValuesTree("Device/Ethernet/Interfaces/Interface[Alias="PHY4"]/Stats/UnicastPacketsSent");

###### Disable blacklists:

     $.xmo.getValuesTree("Device/Hosts/Hosts/Host[@uid='1']");
     $.xmo.setValuesTree('false', "Device/Hosts/Hosts/Host[@uid='1']/BlacklistEnable");
     $.xmo.setValuesTree('false', "Device/Hosts/Hosts/Host[@uid='1']/BlacklistedAccordingToSchedule");
     $.xmo.getValuesTree("Device/Hosts/Hosts");

###### Control RULES:

     sboxApp.controller("AntennaSettingsController", ["$scope", "$rootScope", "$timeout", "AntennaSettings", function($scope, $rootScope, $timeout, AntennaSettings) {
    $scope.populate = function() {
        $scope.antennaTypes = $.constants.antennaTypes;
        var data = AntennaSettings.populate();
        data.autoDetectionAntenna ? $scope.antennaType = 1 : data.enableExtMainAntenna || data.enableExtRXAntenna ? data.enableExtMainAntenna && !data.enableExtRXAntenna ? $scope.antennaType = 3 : data.enableExtMainAntenna && data.enableExtRXAntenna && 
($scope.antennaType = 4) : $scope.antennaType = 2
    }
    ,
    $scope.populate(),
    $scope.save = function() {
        var dataToSave = {};
        switch ($scope.antennaType) {
        case 1:
            dataToSave.autoDetectionAntenna = !0;
            break;
        case 2:
            dataToSave.autoDetectionAntenna = !1,
            dataToSave.enableExtMainAntenna = !1,
            dataToSave.enableExtRXAntenna = !1;
            break;
        case 3:
            dataToSave.autoDetectionAntenna = !1,
            dataToSave.enableExtMainAntenna = !0,
            dataToSave.enableExtRXAntenna = !1;
            break;
        case 4:
            dataToSave.autoDetectionAntenna = !1,
            dataToSave.enableExtMainAntenna = !0,
            dataToSave.enableExtRXAntenna = !0
        }
        AntennaSettings.save(dataToSave, {
            success: function() {
                $rootScope.globalWait = !1,
                $rootScope.showMessage = !0,
                $timeout(function() {
                    $rootScope.$digest()
                })
            },
            error: function() {
                $rootScope.globalWait = !1,
                $rootScope.showMessage = !1,
                $timeout(function() {
                    $rootScope.$digest()
                })
            }
        })
    }
     }
     ]),
     sboxApp.controller("ExtendedMenuController", function($scope, $rootScope) {
         $scope.checkUrlPath = function() {
        $scope.active = "",
        "user.home" === $rootScope.currentRouteName ? $scope.active = "home" : $rootScope.currentRouteName.indexOf("user.internetConnectivity") > -1 ? $scope.active = "connectivity" : $rootScope.currentRouteName.indexOf("user.mysagemcombox") > -1 ? $scope.active 
= "router" : $rootScope.currentRouteName.indexOf("user.accessControl") > -1 ? $scope.active = "access" : $rootScope.currentRouteName.indexOf("user.wifi") > -1 && ($scope.active = "wifi")
    }
    ,
    $scope.checkUrlPath()
     });

###### Change values to true after changes:

     $.xmo.addChild($.xpaths.advanced.remoteManagement.usersUpdate.enable = "true")

###### VOIP

     $.xmo.getValuesTree("Device/Services/VoiceServices/VoiceService[@uid=1]/VoiceProfiles/VoiceProfile[@uid=1]/Enable");
     $.xmo.getValuesTree("Device/Services/VoiceServices/VoiceService[@uid='1']/PhyInterfaces/PhyInterface/OutGoingLine");

###### Edit RIP:

     $.xmo.getValuesTree("Device/Routing/RIP/Enable");
     $.xmo.setValuesTree('true', "Device/Routing/RIP/Enable");

###### Get Country Settings:

    $.xmo.getValuesTree("Device/DeviceInfo/Country");

###### Print/Set CWPD Settings:

    $.xmo.setValuesTree("", "Device/ManagementServer/TR69InternalData/Settings/Port");
    $.xmo.getValuesTree("Device/ManagementServer/TR69InternalData/Settings/Port")

###### Grab passwords for any user:

     $.xmo.client.getPassword('username')

###### UPNP/Twonky settings:

    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/AllName");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/AllPictures");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/AllRadio");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/AllTracks");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/AllVideos");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/InternetRadio");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/MusicNodes/MusicNode[@uid='1']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/MusicNodes/MusicNode[@uid='2']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/MusicNodes/MusicNode[@uid='3']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/MusicNodes/MusicNode[@uid='4']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/MusicNodes/MusicNode[@uid='5']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/PictureNodes/PictureNode[@uid='1']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/PictureNodes/PictureNode[@uid='2']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/PictureNodes/PictureNode[@uid='3']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/PlaylistLastPlayed");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/PlaylistMostPlayed");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/Playlists");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/RootMusic");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/RootPicture");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/RootVideo");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/TagsPicture");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/VideoNodes/VideoNode[@uid='1']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/VideoNodes/VideoNode[@uid='2']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/VideoNodes/VideoNode[@uid='3']/Attributes");
    $.xmo.getValuesTree("Device/UPnP/Settings/UPnPMediaServer/Language");

###### Print WIFI Settings:

     $.xmo.getValuesTree("Device/WiFi/SSIDs");

###### Print/Set portscan detection:

     $.xmo.getValuesTree("Device/Firewall/PortScanDetection");
     $.xmo.setValuesTree('true', "Device/Firewall/PortScanDetection");

###### And for hashPasswords:

     $.xmo.client.hashPassword('username')

###### For authenticate as another user:

     $.xmo.client.authenticate('username')

###### Save cookie with password:

     $.xmo.client.saveToCookie

###### Info about authentications: 

     $.xmo.client._options

###### List pending requests:

     $.xmo.client._pendingRequests

###### Find your UID or SESSION ID wich is needed for set settings permanent:

    $.xmo.client._sessionId

###### List and set different name on any setting, you can use your own js script for example:

    $.xmo.client.__proto__

###### Gather info about your device (included plain text passwords): 

     $.xmo.getValuesTree('Device')

![Screenshot](https://nr1.nu/archive/sagemcom-hacking/device-info.png)

###### Gather info for users

    $.xmo.getValuesTree("Device/UserAccounts/Users");

![Screenshot](https://nr1.nu/archive/sagemcom-hacking/userpass.png)

###### Gather info about deviceInfo, advancedOptions, dns, firewall and other things like maintaince tabs then use:

    $.xmo.getValuesTree($.xpaths.mySagemcomBox);

![Screenshot](https://nr1.nu/archive/sagemcom-hacking/sagemcombox.png)

###### Here is some other things you can do in console if you are lazy:

###### Reboot device: 

     $.xmo.reboot = function() {
        if (!$.xmo.loggedin())
        throw new $.xmo.NotLoggedInError("reboot error: Not logged in");
         var a = $.xmo.client.newRequest();
         a.remoteCall($.xpaths.trafficStats.rpc, "reboot", {
         source: "GUI"
     }),
         a.send();

###### Set another runlevel:

   
    $.xmo.setValuesTree(4, $.xpaths.runlevel);

-   Where levels are:

-   Runlevel 1: - Lock most modem functions including wifi.

-   Runlevel 2: - The same as above with the wifi unlocked.

-   Runlevel 3: - The USB is unlocked. It is not possible to change the IP of the gateway nor to activate the BRIDGE mode or to interfere with FIREWALL.

-   Runlevel 4: - All GVT firmware functions are unlocked. All of the above mentioned in the 3 + change of gateway ip + BRIDGE + firewall mode.

###### For set settings it is required to have knowledge about xpaths, grab them by type:

     $.xpaths

###### So for example to use everything from xpaths we can print our IP as an example by command:

     $.xmo.getValuesTree("Device.IP.Interfaces.Interface[Alias=\"IP_DATA\"].IPv4Addresses.IPv4Address[Alias=\"IP_DATA_ADDRESS\"].IPAddress");

###### There is plenty of configuration files on the router and for download all these we need use newRequest and we also will use a function for this, edit the filename if you found another conf or file you want to download:

    $.config.modules.backupConfigurationAllBackup === !0 ? a.downloadSpecificFile($.xpaths.mySagemcomBox.maintenance.saveRestore.save, "device.cfg", 1, function() {}, function(a) {}) : 
    $.xmo.client.newRequest..downloadFile($.xpaths.mySagemcomBox.maintenance.saveRestore.save, function() {}, function(a) {}), $.xmo.client.newRequest.send;

![Screenshot](https://nr1.nu/archive/sagemcom-hacking/download-files.gif)

###### REMOVE THE ANNOYING AUTO LOGOUT BY CHANGE TIMEOUT TO 0(Unlimited):

![Screenshot](https://nr1.nu/archive/sagemcom-hacking/annoying-logout.png)
     
     $.xmo.setValuesTree(0, "Device.UserInterface.Httpd.SessionTimeout"); 

     or

     $.xmo.sessionTimeOut = 0;


###### Print device model

     $.xmo.getValuesTree($.xpaths.mySagemcomBox.deviceInfo.modelNumber);

###### Change password:

     $.xmo.changePassword("user","password");

###### Get values for wizard:

      $.xpaths.wizard

###### List all features that is possible like clouds as dropbox, usb stuff, tv over wifi things and led configuration and much much more:

     $.xpaths.checkFeaturesAvailable

     Of course you can use them one by one aswell but the trick is to NOT include checkFeaturesAvailable: 
   
     $.xmo.getValuesTree($.xpaths.myCloud);
     $.xmo.getValuesTree($.xpaths.Device);
     $.xmo.getValuesTree($.xpaths.adminAdvanced);
     $.xmo.getValuesTree($.xpaths.accessControl);
     $.xmo.getValuesTree($.xpaths.accessControl.firewall);
     $.xmo.getValuesTree($.xpaths.accessControl.serviceCapability); 

     .. Here is some other things you might check or set like VPN's and such under features: 

     showedpages.dhcpEnable
     showedpages.comhem
     showedpages.certificates.enable
     showedpages.bell.enable
     showedpages.VPN.enable
     showedpages.VPN
     modules.myBox.dhcp.blacklistedIps
     modules.myBox.dhcp.defaultValues
     .....

###### Enable samba:

      $.xmo.setValuesTree('true', "massStorage.samba.enable");

###### Enable walletgarden:

      $.xmo.setValuesTree('true', "walledGarden.enable");

###### Save
    
     $.xmo.setValuesTree('true', "maintenance.saveRestore.save");

###### Setup dropbear

     mkdir -p /tmp/dropbear
     /usr/bin/dropbearkey -t rsa -f 
     /tmp/dropbear/dropbear_rsa_host_key 2>&- >&-
     /usr/bin/dropbearkey -t dss -f 
     /tmp/dropbear/dropbear_dss_host_key 2>&- >&-
     vim /etc/dropbear/authorized_keys
     chmod 600 authorized_keys

###### LXC - Telia 

     lxc-start -n teliaLxc -F


###### LXC - Any support distro below (will add a howto soon): 

    /usr/share/lxs/userns.conf
    /usr/share/lxs/ubuntu-cloud.userns.conf
    /usr/share/lxs/plamo.common.conf
    /usr/share/lxs/opensuse.userns.conf
    /usr/share/lxs/gentoo.common.conf
    /usr/share/lxs/debian.common.conf
    /usr/share/lxs/centos.userns.conf
    /usr/share/lxs/ubuntu.userns.conf
    /usr/share/lxs/ubuntu-cloud.lucid.conf
    /usr/share/lxs/oracle.userns.conf
    /usr/share/lxs/opensuse.common.conf
    /usr/share/lxs/fedora.userns.conf
    /usr/share/lxs/common.seccomp
    /usr/share/lxs/centos.common.conf
    /usr/share/lxs/ubuntu.lucid.conf
    /usr/share/lxs/ubuntu-cloud.common.conf
    /usr/share/lxs/oracle.common.conf
    /usr/share/lxs/gentoo.userns.conf
    /usr/share/lxs/fedora.common.conf
    /usr/share/lxs/common.conf.d
    /usr/share/lxs/archlinux.userns.conf
    /usr/share/lxs/ubuntu.common.conf
    /usr/share/lxs/plamo.userns.conf
    /usr/share/lxs/openwrt.common.conf
    /usr/share/lxs/gentoo.moresecure.conf
    /usr/share/lxs/debian.userns.conf
    /usr/share/lxs/common.conf
    /usr/share/lxs/archlinux.common.conf


###### General Admin Stuff (Edit after your neeeds)

###### USERS (USER/1 = admin)

      $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='1']");
      $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='1']/Role");
      $.xmo.setValuesTree("SuperUser", "Device/UserAccounts/Users/User[@uid='1']/Role");
      $.xmo.setValuesTree("true", "Device/UserAccounts/Users/User[@uid='1']/CurrentlyRemoteAccess");
      $.xmo.setValuesTree("wuseman@nr1.nu", "Device/UserAccounts/Users/User[@uid='1']/Email");
      $.xmo.setValuesTree("Sweden", "Device/UserAccounts/Users/User[@uid='1']/Country");
      $.xmo.setValuesTree("wuseman", "Device/UserAccounts/Users/User[@uid='1']/Lastname");
      $.xmo.setValuesTree("true", "Device/UserAccounts/Users/User[@uid='1']/OwnPass");
      $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='1']/RemoteAccesses/RemoteAccess[@uid='1']");
      $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='2']/RemoteAccesses/RemoteAccess[@uid='1']");
      $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='3']/RemoteAccesses/RemoteAccess[@uid='1']");
      $.xmo.getValuesTree("Device/UserAccounts/Users/User[@uid='2']/RemoteAccesses/RemoteAccess[@uid='1']");

###### Firmware
      
      http://MASKED
      USER: MASKED
      PASS: MASKED
      $.xmo.getValuesTree("Device/ManagementServer/Username");
      $.xmo.setValuesTree("", "Device/ManagementServer/Username");
      $.xmo.getValuesTree("Device/ManagementServer/Password");
      $.xmo.setValuesTree("", "Device/ManagementServer/Password");

###### Disable all remote acccess for ISP, copy and paste:

      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_MNGT"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_MNGT"]/Router')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/Enabled')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/IPv4Addresses/IPv4Address[Alias="IP_VOIP_ADDRESS"]/IPAddress')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/IPv4Addresses/IPv4Address[Alias="IP_VOIP_ADDRESS"]/Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/IPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/IPv4Addresses/IPv4Address[Alias="IP_VOIP_ADDRESS"]/Enable')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/Name')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/Router')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_IPTV"]/IPv4Addresses/IPv4Address[Alias="IPTV_ADDRESS"]/IPAddress')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_IPTV"]/IPv4Addresses/IPv4Address[Alias="IPTV_ADDRESS"]/Enable') 
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_IPTV"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_IPTV"]/IPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_IPTV"]/IPv4Addresses/IPv4Address[Alias="IPTV_ADDRESS"]/Enable')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_IPTV"]/Name')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_IPTV"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_IPTV"]/Router')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST"]/IPv4Addresses/IPv4Address[Alias="IP_BR_GUEST_ADDRESS"]/IPAddress')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST"]/IPv4Addresses/IPv4Address[Alias="IP_BR_GUEST_ADDRESS"]/Enable') 
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST"]/IPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST"]/IPv4Addresses/IPv4Address[Alias="IP_BR_GUEST_ADDRESS"]/Enable')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST"]/Name')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST"]/Router')
      $.xmo.setValuesTree("HEY1", 'Device/IP/Interfaces/Interface[Alias="IP_MNGT"]/Alias')
      $.xmo.setValuesTree("HEY2", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/Alias')
      $.xmo.setValuesTree("HEY3", 'Device/IP/Interfaces/Interface[Alias="IP_IPTV"]/Alias')
      $.xmo.setValuesTree("HEY4", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST"]/Alias')
      $.xmo.setValuesTree("HEY5", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST"]/Alias')
      $.xmo.setValuesTree("HEY6", 'Device/IP/Interfaces/Interface[Alias="IP_BR_GUEST_ADDRESS"]/Alias')
      $.xmo.setValuesTree("HEY7", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP_ADDRESS"]/Alias')
      $.xmo.setValuesTree("HEY8", 'Device/IP/Interfaces/Interface[Alias="IP_MNGT_ADDRESS"]/Alias')
      $.xmo.setValuesTree("hey", 'Device/IP/Interfaces/Interface[Alias="IP_VOIP"]/Alias')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY"]/Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY1"]/Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY2"]/Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY3"]/Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY4"]/Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY5"]/Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY6"]/Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY7"]/Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY8"]/Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY1"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY2"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY3"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY4"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY5"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY6"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY7"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY8"]/IPv4Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY"]/IPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY1"]/EIPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY2"]/IPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY3"]/IPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY4"]/IPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY5"]/IPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY6"]/IPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY7"]/IPv6Enable')
      $.xmo.setValuesTree("false", 'Device/IP/Interfaces/Interface[Alias="HEY8"]/IPv6Enable')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY1"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY2"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY3"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY4"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY5"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY6"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY7"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY8"]/LowerLayers')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY1"]/Name')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY2"]/Name')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY3"]/Name')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY4"]/Name')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY5"]/Name')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY6"]/Name')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY7"]/Names')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY8"]/Name')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY1"]/Router')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY2"]/Router')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY3"]/Router')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY4"]/Router')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY5"]/Router')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY6"]/Router')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY7"]/Router')
      $.xmo.setValuesTree("", 'Device/IP/Interfaces/Interface[Alias="HEY8"]/Router');

###### Rip

      $.xmo.getValuesTree("Device/Routing/RIP/Enable");
      $.xmo.setValuesTree("true", "Device/Routing/RIP/Enable");

###### Leds

      $.xmo.getValuesTree("Device/Managers/Led/LedPowerBlink");
      $.xmo.setValuesTree("true", "Device/Managers/Led/LedPowerBlink");

###### AccessControl
      $.xmo.getValuesTree("Device/Managers/NetworkLan/AccessControlEnable");
      $.xmo.setValuesTree("true", "Device/Managers/NetworkLan/AccessControlEnable");

###### Logs

      $.xmo.getValuesTree("Device/DeviceInfo/FlushDeviceLog");
      $.xmo.getValuesTree("true", "Device/DeviceInfo/FlushDeviceLog");
	

###### Cwmpd

      $.xmo.getValuesTree("Device/ManagementServer/EnableCWMP")
      $.xmo.setValuesTree(false, "Device/ManagementServer/EnableCWMP")

###### Print masstorage data:

      $.xmo.setValuesTree("wuseman", $.xpaths.mySagemcomBox.massStorage.dlnaMediaName)

###### Route info

      $.xmo.getValuesTree("Device/Routing/RouteInformation/Enable");
      $.xmo.setValuesTree("true", "Device/Routing/RouteInformation/Enable");

###### CLI Password

      $.xmo.getValuesTree("Device/Services/CLIPassword");
      $.xmo.setValuesTree("odemnn", "Device/Services/CLIPassword");

###### Parent control

      $.xmo.getValuesTree("Device/Services/ParentalControl/Enable");
      $.xmo.setValuesTree("true", "Device/Services/ParentalControl/Enable");

###### Random stuff:

      $.xmo.getValuesTree($.xpaths.management);
      $.xmo.getValuesTree($.xpaths.main);
      $.xmo.getValuesTree($.xpaths.rpc);
      $.xmo.getValuesTree($.xpaths.technicalLogFast);
      $.xmo.getValuesTree($.xpaths.adminAdvanced);
      $.xmo.getValuesTree($.xpaths.internetConnectivity);
      $.xmo.getValuesTree($.xpaths.trafficStats); < SSH HERE
      $.xmo.getValuesTree("Device/Routing/RIP/X_SAGEMCOM_RIPIPPrefix/X_SAGEMCOM_RIPIPPrefix/RIPDefaultGateway");
       $.xmo.getValuesTree($.xpaths.mySagemcomBox)
      ipSecEnable: "Device/NAT/IPSecPassthroughEnable"
      portScanDetection: "Device/Firewall/PortScanDetection"
      pptpEnable: "Device/NAT/PPTPPassthroughEnable"
      remoteConfig:             "Device/UserAccounts/Users/User[@uid="#uid#"]/RemoteAccesses/RemoteAccess[@uid="#uidRemoteAccess#"]/WANRestriction"
      remoteIPAddress:       "Device/IP/Interfaces/Interface[Alias='IP_DATA']/IPv4Addresses/IPv4Address[Alias='IP_DATA_ADDRESS']/IPAddress"
      remoteServicePort: "Device/UserAccounts/Users/User[@uid='3']/RemoteAccesses/RemoteAccess[@uid='3']/Port"
      sipAlgEnable: "Device/NAT/SIPALGEnable"
      upnpEnable: "Device/UPnP/Device/Enable"
      users: "Device/UserAccounts/Users"
      wanBlockingEnable: "Device/Firewall/WanBlocking"

##### Find more info in configuration file in this repo. 

###### .......and so on.......

###### Default login screen:

![Screenshot](https://nr1.nu/archive/sagemcom-hackingcom-default-login.png)

###### Go visit 192.168.1.1:9000 to enjoy the hidden Twonky interface:

![Screenshot](https://nr1.nu/archive/sagemcom-hacking/twonky-sagemcom.png)

###### Please notice that 9000 is the SSH port, you can reset settings by:

    curl 192.168.1.1:9000/rpc/reset
    > reset to defaults!

###### Check webconfig/config.js for more rpc files, few examples:

    curl 192.168.1.1:9000/nmc/rpc
    curl 192.168.1.1:9000/webconfig/config.js

![Screenshot](https://nr1.nu/archive/sagemcom-hacking/sagemcom-5370e.png)

##### List folders by an exploit:

    curl http://192.168.1.1:9000/rpc/dir?=path=/bin/ls

    001D/
    003D/lxc
    004D/run
    005D/usr
    006D/www
    007D/root
    008D/Music
    009D/Video
    010D/telia
    011D/Picture
    012D/twonky
    016D/mnt
    018D/overlay
    020D/rom
    023D/tmp
    024D/var

##### Get all info about twonky

    curl http://192.168.1.1:9000/rpc/get_all

    friendlyname=myTwonky Library at mynetwork
    ip=
    nicrestart=1
    v=0
    platform=UNIX
    httpport=
    ininame=twonkyvision-mediaserver.ini
    inipath=/usr/local/mediaserver
    read_only=0
    ssdpttl=4
    ssdpheartbeattimeout=100
    appdata=/var/twonky
    clearclientsonrestart=0
    disablelocalssdp=1
    enabletls=1
    nmcmode=1
    vlevel=4
    stack_size=196608
    language=en
    mediafusionserverurl=
    userid=
    portalusername=
    twonkyinfo=
    reportdevice=1
    enablenmcwebapi=1
    followlinks=1
    flushlogmsg=0
    webdavport=
    ignoreip=
    mediatypefilter=A
    accessuser=
    accesspwd=
    cachedir=/var/twonky/db/cache
    cachemaxsize=
    cdkey=
    clientautoenable=1
    codepage=932
    compilationsdir=Compilations,Sampler
    contentbase=/
    contentdir=
    dbdir=/var/twonky/db
    dyndns=
    enableweb=2
    httpremoteport=
    ignoredir=AppleDouble,AppleDB,AppleDesktop,TemporaryItems,.fseventsd,.Spotlight-            V100,.Trashes,.Trash,RECYCLED,RECYCLER,RECYCLE.BIN
    ituneslib=default
    scantime=-1
    streambuffer=16384
    uploadenabled=1
    servermanagedmusicdir=/twonky/music/Twonky
    servermanagedpicturedir=/twonky/pictures/Twonky
    servermanagedvideodir=/twonky/videos/Twonky
    mediastatisticsenabled=0
    mediastatisticsdir=/var/twonky/media-statistics/
    defaultview=advanceddefault
    bgtrans=
    rmdrives=
    rmhomedrive=/var/twonky/db
    rmautoshare=0
    maxitems=0
    suppressmenu=
    aggregation=0
    aggmode=0
    secure_folder_path=
    autoupdateinstall=0
    remoteaccess=0
    remoteaccessflash=0
    dtcpsessionlimit=8
    dtcpsessioncount=
    uploaddestinationfriendlyname=UploadDestination
    uploadrestrictedprofiles=
    disablefrontends=
    upnpuploadlimit=0
    disablesleepmode=0
    uploadmaxfilesize=0,0,0
    httpsessionlimit=
    clearcacheonrestart=
    scalermaxpixels=
    hdrlnextreadyvalue=180
    enablenonkeyframetstgen=0
    importdir=
    disablemytwonky=0
    includefolder=0
    rmadditunes=0
    rmupload=0
    contentdiscoverymode=7
    enableruiserver=0
    disabletimeseek=0
    albumartdir=
    disableduplicateremoval=0
    ignoredirwithfile=.nomedia,.ignorethis
    clearclientsonnicchange=0
    forceinitialscan=0
    classifiedaccessuser=
    classifiedaccesspwd=
    importscantime=
    limittranscodingperclient=0
    disablepmscaling=0
    ........

##### Get info about all settings via xpaths:

     $.xmo.getValuesTree($.xpaths.Device)
     $.xmo.getValuesTree($.xpaths.XORCryptKey)
     $.xmo.getValuesTree($.xpaths.accessControl)
     $.xmo.getValuesTree($.xpaths.adminAdvanced)
     $.xmo.getValuesTree($.xpaths.advanced) # HOW TO CHANGE NULL TO 1 ?
     $.xmo.getValuesTree($.xpaths.availability)
     $.xmo.getValuesTree($.xpaths.broadband)
     $.xmo.getValuesTree($.xpaths.ipv6Status)
     $.xmo.getValuesTree($.xpaths.cableModem)
     $.xmo.getValuesTree($.xpaths.checkFeaturesAvailable)
     $.xmo.getValuesTree($.xpaths.myMedia)
     $.xmo.getValuesTree($.xpaths.dect)
     $.xmo.getValuesTree($.xpaths.dhcpLeases)
     $.xmo.getValuesTree($.xpaths.ethernet)
     $.xmo.getValuesTree($.xpaths.ethernetDevice)
     $.xmo.getValuesTree($.xpaths.firstConnection)
     $.xmo.getValuesTree($.xpaths.forbiddenIps)
     $.xmo.getValuesTree($.xpaths.gateway)
     $.xmo.getValuesTree($.xpaths.gpon)
     $.xmo.getValuesTree($.xpaths.greTunnel)
     $.xmo.getValuesTree($.xpaths.healthCheck)
     $.xmo.getValuesTree($.xpaths.internetConnectivity)
     $.xmo.getValuesTree($.xpaths.leds)
     $.xmo.getValuesTree($.xpaths.main)
     $.xmo.getValuesTree($.xpaths.management)
     $.xmo.getValuesTree($.xpaths.accountSettings)
     $.xmo.getValuesTree($.xpaths.myCloud)
     $.xmo.getValuesTree($.xpaths.mySagemcomBox)
     $.xmo.getValuesTree($.xpaths.mymedia)
     $.xmo.getValuesTree($.xpaths.neighborAps)
     $.xmo.getValuesTree($.xpaths.rpc)
     $.xmo.getValuesTree($.xpaths.runlevel)
     $.xmo.getValuesTree($.xpaths.scheduling)
     $.xmo.getValuesTree($.xpaths.singleLine)
     $.xmo.getValuesTree($.xpaths.splashScreen)
     $.xmo.getValuesTree($.xpaths.ssidCreation)
     $.xmo.getValuesTree($.xpaths.stats)
     $.xmo.getValuesTree($.xpaths.technicalLogFast)
     $.xmo.getValuesTree($.xpaths.trafficStats)
     $.xmo.getValuesTree($.xpaths.voice)
     $.xmo.getValuesTree($.xpaths.wan)
     $.xmo.getValuesTree($.xpaths.wifi)
     $.xmo.getValuesTree($.xpaths.wifiBandSteering)
     $.xmo.getValuesTree($.xpaths.wifiRestoreDefault)
     $.xmo.getValuesTree($.xpaths.wizard)

##### Some other intresting links without any required login you can visit (there is tons of settings to enable to get a really powerful router. This you must figured out yourself since it's to much work to fix a wiki for this atm, I maybe fixing later - have 
fun! :)):

      $.xmo.getValuesTree("Device\/DeviceInfo\/GUIFirmwareVersion/*")
      $.xmo.getValuesTree("Device\/DeviceInfo\/HardwareVersion/*")
      $.xmo.getValuesTree("Device\/DeviceInfo\/MACAddress/*")
      $.xmo.getValuesTree("Device\/DeviceInfo\/SerialNumber/*")
      $.xmo.getValuesTree("Device\/DeviceInfo\/SoftwareVersion/*")
      $.xmo.getValuesTree("Device\/DeviceInfo\/UpTime/*")
      $.xmo.getValuesTree("Device\/DHCPv4\/Clients\/Client[@uid='1']\/*")
      $.xmo.getValuesTree("Device\/DHCPv4\/Server\/Enable/*")
      $.xmo.getValuesTree("Device\/DHCPv4\/Server\/Pools\/*")
      $.xmo.getValuesTree("Device\/DNS\/Client\/HostName/*")
      $.xmo.getValuesTree("Device\/DNS\/Client\/LocalDomains/*")
      $.xmo.getValuesTree("Device\/DNS\/Relay\/Forwardings\/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Interfaces\/Interface[PHY1]/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Interfaces\/Interface[PHY4]/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Interfaces\/Interface[@uid='1']/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Interfaces\/Interface[@uid='1']\/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Interfaces\/Interface[@uid='2']\/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Interfaces\/Interface[@uid='3']\/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Interfaces\/Interface[@uid='4']/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Interfaces\/Interface[@uid='4']\/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Interfaces\/Interface[@uid='7']\/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Links\/Link[ETHLNK_BR_DATA]/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Links\/Link[ETHLNK_BR_GUEST]/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Links\/Link[ETHLNK_BR_LAN]/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Links\/Link[@uid='1']\/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Links\/Link[@uid='2']\/*")
      $.xmo.getValuesTree("Device\/Ethernet\/Links\/Link[@uid='3']\/*")
      $.xmo.getValuesTree("Device\/Ethernet\/VLANTerminations\/VLANTermination[VLAN_IPTV_CISCO]/*")
      $.xmo.getValuesTree("Device\/Ethernet\/VLANTerminations\/VLANTermination[VLAN_MNGT]/*")
      $.xmo.getValuesTree("Device\/Ethernet\/VLANTerminations\/VLANTermination[VLAN_TV_UNTAGGED]/*")
      $.xmo.getValuesTree("Device\/Ethernet\/VLANTerminations\/VLANTermination[VLAN_VOIP_CISCO]/*")
      $.xmo.getValuesTree("Device\/Firewall\/Chains\/Chain[@uid='2']\/*")
      $.xmo.getValuesTree("Device\/Firewall\/Chains\/Chain[@uid='3']\/*")
      $.xmo.getValuesTree("Device\/Firewall\/Chains\/Chain[@uid='4']\/*")
      $.xmo.getValuesTree("Device\/Firewall\/Config/*")
      $.xmo.getValuesTree("Device\/Firewall\/RespondToPing/*")
      $.xmo.getValuesTree("Device\/Hosts\/Hosts/*")
      $.xmo.getValuesTree("Device\/Hosts\/Hosts\/Host[@uid='1']/*")
      $.xmo.getValuesTree("Device\/Hosts\/Hosts\/Host[@uid='2']/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[IP_BR_GUEST]/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[IP_BR_LAN]/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[IP_BR_LAN]\/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[IP_DATA]/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[IP_DATA]\/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[IP_IPTV]/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[IP_MNGT]/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[IPTV_UNTAGED]/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[IP_VOIP]/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[@uid='1']\/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[@uid='2']\/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[@uid='3']\/*")
      $.xmo.getValuesTree("Device\/IP\/Interfaces\/Interface[@uid='7']\/*")
      $.xmo.getValuesTree("Device\/IP\/IPv4Status/*")
      $.xmo.getValuesTree("Device\/IP\/IPv6Enable/*")
      $.xmo.getValuesTree("Device\/IP\/IPv6Status/*")
      $.xmo.getValuesTree("Device\/ManagementServer\/ConnectionRequestPassword/*")
      $.xmo.getValuesTree("Device\/ManagementServer\/Password/*")
      $.xmo.getValuesTree("Device\/Managers\/NetworkData\/BridgedMode/*")
      $.xmo.getValuesTree("Device\/NAT\/InterfaceSettings\/InterfaceSetting[@uid='1']\/*")
      $.xmo.getValuesTree("Device\/NAT\/InterfaceSettings\/InterfaceSetting[@uid='2']\/*")
      $.xmo.getValuesTree("Device\/NAT\/InterfaceSettings\/InterfaceSetting[@uid='3']\/*")
      $.xmo.getValuesTree("Device\/NAT\/PortMappings/*")
      $.xmo.getValuesTree("Device\/Routing\/Routers\/Router[DEFAULT]/*")
      $.xmo.getValuesTree("Device\/Se/*")
      $.xmo.getValuesTree("Device\/Serv/*")
      $.xmo.getValuesTree("Device\/Services\/Bandsteering\/Enable/*")
      $.xmo.getValuesTree("Device\/Services\/VoiceServices\/VoiceService[@uid='1']\/*")
      $.xmo.getValuesTree("Device\/TELIA\/Led\/DimmedMode/*")
      $.xmo.getValuesTree("Device\/Time\/CurrentLocalTime/*")
      $.xmo.getValuesTree("Device\/Time\/Enable/*")
      $.xmo.getValuesTree("Device\/Time\/LocalTimeZone/*")
      $.xmo.getValuesTree("Device\/Time\/LocalTimeZoneName/*")
      $.xmo.getValuesTree("Device\/Time\/NTPServer1/*")
      $.xmo.getValuesTree("Device\/Time\/NTPServer2/*")
      $.xmo.getValuesTree("Device\/Time\/Status/*")
      $.xmo.getValuesTree("Device\/UPnP\/Device\/UPnPIGD/*")
      $.xmo.getValuesTree("Device\/UPnP\/Device\/UPnPMediaServer/*")
      $.xmo.getValuesTree("Device\/UPnP\/Settings\/UPnPIGD\/*")
      $.xmo.getValuesTree("Device\/UPnP\/Settings\/UPnPMediaServer\/*")
      $.xmo.getValuesTree("Device\/USB\/Enable/*")
      $.xmo.getValuesTree("Device\/USB\/USBHosts\/Hosts\/*")
      $.xmo.getValuesTree("Device\/UserAccounts\/Users\/User[@uid='1']\/*")
      $.xmo.getValuesTree("Device\/UserAccounts\/Users\/User[@uid='2']\/*")
      $.xmo.getValuesTree("Device\/UserAccounts\/Users\/User[@uid='3']\/*")
      $.xmo.getValuesTree("Device\/UserAccounts\/Users\/User[@uid='4']\/*")
      $.xmo.getValuesTree("Device\/UserAccounts\/Users\/User[@uid='5']\/*")
      $.xmo.getValuesTree("Device\/WebAccesses\/PortTrigger/*")
      $.xmo.getValuesTree("Device\/WebAccesses\/WebRestriction/*")
      $.xmo.getValuesTree("Device\/WiFi\/AccessPoints\/AccessPoint[@uid='1']/*")
      $.xmo.getValuesTree("Device\/WiFi\/AccessPoints\/AccessPoint[@uid='1']\/*")
      $.xmo.getValuesTree("Device\/WiFi\/AccessPoints\/AccessPoint[@uid='2']/*")
      $.xmo.getValuesTree("Device\/WiFi\/AccessPoints\/AccessPoint[@uid='2']\/*")
      $.xmo.getValuesTree("Device\/WiFi\/AccessPoints\/AccessPoint[@uid='3']/*")
      $.xmo.getValuesTree("Device\/WiFi\/AccessPoints\/AccessPoint[@uid='3']\/*")
      $.xmo.getValuesTree("Device\/WiFi\/AccessPoints\/AccessPoint[@uid='4']/*")
      $.xmo.getValuesTree("Device\/WiFi\/AccessPoints\/AccessPoint[@uid='4']\/*")
      $.xmo.getValuesTree("Device\/WiFi\/Radios\/Radio[@uid='1']\/*")
      $.xmo.getValuesTree("Device\/WiFi\/Radios\/Radio[@uid='2']\/*")
      $.xmo.getValuesTree("Device\/WiFi\/SSIDs\/*")
      $.xmo.getValuesTree("Device\/WiFi\/SSIDs\/SSID[@uid='1']\/*")
      $.xmo.getValuesTree("Device\/WiFi\/SSIDs\/SSID[@uid='2']\/*")
      $.xmo.getValuesTree("Device\/WiFi\/SSIDs\/SSID[@uid='3']\/*")
      $.xmo.getValuesTree("Device\/WiFi\/SSIDs\/SSID[@uid='4']\/*")
      $.xmo.getValuesTree("Device\/WiFi\/SSIDs\/SSID[WL_GUEST]/*")
      $.xmo.getValuesTree("Device\/WiFi\/SSIDs\/SSID[WL_GUEST_5G]/*")
      $.xmo.getValuesTree("Device\/WiFi\/SSIDs\/SSID[WL_PRIV]/*")
      $.xmo.getValuesTree("Device\/WiFi\/SSIDs\/SSID[WL_VIDEO_5G]/*")
      $.xmo.setValuesTree("8213d162ea32a3fcfec2aae5538c48e5", "Device/UserAccounts/Users/User[@uid='1']/Password");
      $.xmo.setValuesTree("8213d162ea32a3fcfec2aae5538c48e5", "Device/UserAccounts/Users/User[@uid='2']/Password");
      $.xmo.setValuesTree("8213d162ea32a3fcfec2aae5538c48e5", "Device/UserAccounts/Users/User[@uid='3']/Password");
      $.xmo.setValuesTree("8213d162ea32a3fcfec2aae5538c48e5", "Device/UserAccounts/Users/User[@uid='4']/Password");
      $.xmo.setValuesTree("assist", "Device/UserAccounts/Users/User[@uid='1']/ClearTextPassword");
      $.xmo.setValuesTree("assist", "Device/UserAccounts/Users/User[@uid='2']/ClearTextPassword");
      $.xmo.setValuesTree("assist", "Device/UserAccounts/Users/User[@uid='3']/ClearTextPassword");
      $.xmo.setValuesTree("assist", "Device/UserAccounts/Users/User[@uid='4']/ClearTextPassword");
      $.xmo.setValuesTree("assist", "Device/UserAccounts/Users/User[@uid='4']/ClearTextPassword");
      $.xmo.setValuesTree("true", "Device/UserAccounts/Users/User[@uid='1']/Functionalities[@uid='0']/Writable");
      $.xmo.setValuesTree("wuseman", "Device/UserAccounts/Users/User[@uid='1']/SecretQuery");
      $.xmo.setValuesTree("wuseman", "Device/UserAccounts/Users/User[@uid='1']/ClearTextPassword");
      $.xmo.setValuesTree("true", "Device/UserAccounts/Users/User[@uid='1']/CurrentlyRemoteAccess);
      $.xmo.setValuesTree('SuperUser', "Device/UserAccounts/Users/User[@uid='1']/Role");
      $.xmo.setValuesTree("internal", "Device/UserAccounts/Users/User[@uid='1']/Profiles/Profile[@uid='1']/Name");
      $.xmo.getValuesTree("Device\/WiFi\/AccessPoints\/AccessPoint[@uid='3']\/Security\/ModeEnabled");
      $.xmo.getValuesTree("Device\/WiFi\/AccessPoints\/AccessPoint[@uid='3']\/Security\/WEPKey");
      $.xmo.getValuesTree("Device\/USB\/USBHosts\/Hosts\/Host[@uid='1']\/Devices");
      $.xmo.getValuesTree("Device\/USB\/USBHosts\/Hosts\/Host[@uid='2']\/Devices");
      $.xmo.getValuesTree("Device\/WiFi\/SSIDs\/SSID[@uid='3']\/Status");
      $.xmo.getValuesTree("Device\/WiFi\/Radios\/Radio[@uid='1']\/OperatingChannelBandwidth");
      $.xmo.getValuesTree("Device/WiFi/AccessPoints/AccessPoint[@uid='1']/Security/KeyPassphrase");
      $.xmo.getValuesTree("Device/DHCPv4/Server/Pools/Pool[@uid='1']/SubnetMask");

##### Reminders for myself otherwise i forget, my brain goes in 100 24/7 cant remember everything ;)

###### Don't forget too. 

-    Crack 'nobody' password from teliaLxc, unshadow has been done in ~/.crackem

-    Figure out why below command is not allowed? 

     $.xmo.getValuesTree("true", "Device/DeviceInfo/FlushDeviceLog");

-    Find the reason why samba deny us from login on GUI after we allowing more features? Printed log below
  
     /home/WORKSPACE/TELIA/BP_TELIA_5370_v0-58-x_20181126_2_90/fw-scos/openwrt/build_dir/target-sagemcom_5370e-telia_arm_uClibc-0.9.32_eabi/samba-3.0.37/source/lib/pidfile.c:pidfile_create(116)
     ERROR: smbd is already running. File /var/run/smbd.pid exists and process id 2421 is running.
     [2019/01/30 06:21:38, 0] smbd/server.c:main(979)
     smbd version 3.0.37 started.
     Copyright Andrew Tridgell and the Samba Team 1992-2009
     [2019/01/30 06:21:38, 2] smbd/server.c:main(983)
     uid=0 gid=0 euid=0 egid=0
     [2019/01/30 06:21:38, 0] param/loadparm.c:map_parameter(2794)
     [2019/01/30 06:21:38, 2] lib/util_unistr.c:init_valid_table(251)
     creating default valid table
     [2019/01/30 06:21:38, 2] lib/interface.c:add_interface(81)
     [2019/01/30 06:21:38, 0] 
     /home/WORKSPACE/TELIA/BP_TELIA_5370_v0-58-x_20181126_2_90/fw-scos/openwrt/build_dir/target-sagemcom_5370e-telia_arm_uClibc-0.9.32_eabi/samba-3.0.37/source/lib/pidfile.c:pidfile_create(116)

##### Main configurations is stored in LXC Telia dir:

    /telia/lxc/rootfs/etc/hosts

###### JQUERY

     jQuery.gui = {};
     jQuery.gui.api = {};
     jQuery.gui.opt = {
         GUI_VERSION_OPT: "0.1",
         GUI_LANGUAGES_OPT: "da:en",
         GUI_DEFAULT_DATAMODEL_OPT: "gtw",
         GUI_DEFAULT_LANG_OPT: "fr",
         GUI_I18N_CGI_OPT: false,
         GUI_SAVE_LOGIN_OPT: true,
         XMO_REMOTE_HOST: "",
         GUI_AJAX_TIMEOUT_OPT: 30,
         GUI_ACTIVATE_GUI_CONSOLE_OPT: false,
         GUI_ACTIVATE_SHA512ENCODE_OPT: 0
     };

###### Serial Port


![Bootloader Log](https://raw.githubusercontent.com/wuseman/SAGEMCOM-FAST-5370e-TELIA/master/bootlogs/sagemcom_bootlog.txt)

![Screnshot](sagemcim_bootlaoder.gif)

###### Hidden hacks:

    http://192.168.1.1/0.1/gui/?item=dhcpdstaticlease.cmd?action=add&mac=MAC:ADDR:HERE&static_ip=192.168.1.1&sessionKey=<session_key>#/
    
   
#### REQUIREMENTS

A linux setup would be good ;)

#### CONTACT 

If you have problems, questions, ideas or suggestions please contact me by posting to wuseman@nr1.nu

#### GOOD INFO

You can find more info and good answers from this thread below from whirlpool where i am active too, if you know something that we don't please feel free to contribute in the thread or use my issue template. Thanks:-)

https://forums.whirlpool.net.au/archive/2746904

#### Random URLS for sagemcom

    https://forum.archive.openwrt.org/viewtopic.php?id=73005
    
    https://www.dslreports.com/forum/r28188441-Line-Stats-Telnet-Unlock-Tool-for-Sagemcom-2864-V2-00

### Tools

    # Sagemunlock tool for 2864 v2.0.1
    https://mega.nz/file/ohMxkArD#JKqV9gd9wBZBRIe_EFPwt0HFqalrdv9fVx72qQqm38A
#### WEB SITE

Visit my websites and profiles for the latest info and updated tools

https://github.com/wuseman/ && https://nr1.nu && https://stackoverflow.com/users/9887151/wuseman

#### END!


