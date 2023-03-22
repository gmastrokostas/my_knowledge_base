**Enable Bonding**
```
echo "# Load the bonding kernel module at boot" > /etc/modules-load.d/bonding.conf
echo "bonding" >> /etc/modules-load.d/bonding.conf
modprobe bonding
```

**How to configure interfaces ifcfg-ens34 and ifcfg-ens35 to form bond0 with IP address 192.168.1.101**


**1) Under /etc/sysconfig/network-scripts  create following file**
```
DEVICE=bond0
NAME=bond0
TYPE=Bond
BONDING_MASTER=yes
BONDING_OPTS="mode=1 primary=ens34"
ONBOOT=yes
BOOTPROTO=none
IPADDR=192.168.1.115
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
```
**2) Under /etc/sysconfig/network-scripts edit ifcfg-ens34 and ifcfg-35 to look like this**
```
DEVICE=ens34
NAME=ens34
UUID=d2b34edc-7893-4302-b4d2-8bac9926403d
ONBOOT=YES
TYPE=Ethernet
MASTER=bond0
SLAVE=yes

TYPE=Ethernet
NAME=ens35
UUID=acbaacbc-e570-4e10-b775-c65ddb230dc7
DEVICE=ens35
ONBOOT=yes
MASTER=bond0
SLAVE=yes
```

**3) Bring the bond0 interface up.**
```
ifdown bond0; ifup bond0
```

**Side note about Netwok Manager -- you can tell NM to ignore specific interfaces**
```
#/etc/NetworkManager/NetworkManager.conf
[main]
unmanaged-devices=interface-name:bond0
```

