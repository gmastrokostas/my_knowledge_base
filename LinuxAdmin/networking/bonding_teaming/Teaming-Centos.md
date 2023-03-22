**Enabling Teaming**
```
modprobe bonding
Modinfo team
```
 **Make following edits on vi /etc/sysconfig/network-scripts/ifcfg-team0**
 ```
cat ifcfg-team0
DEVICE=team0
NAME=team0
DEVICETYPE=Team
TEAM_CONFIG='{"runner":{"name":"activebackup"},"link_watch":{"name":"ethtool"}}'
ONBOOT=yes
BOOTPROTO=none
IPADDR=192.168.1.121
PREFIX=24
GATEWAY=192.168.1.1
```
**Make following edits on vi /etc/sysconfig/network-scripts/ifcfg-ens33**
```
TEAM_MASTER=team0
TEAM_PORT_CONFIG='{"prio:99}'
DEVICETYPE=TeamPort
BOOTPROTO=static
NAME=ens33
DEVICE=ens33
UUID=ec65fd53-adde-46d1-86cd-938af60deb86
DEVICE=ens33
HWADDR=00:0c:29:bc:9e:98
```
**Make following edits on vi /etc/sysconfig/network-scripts/iifcfg-ens37**
```
TEAM_MASTER=team0
TEAM_PORT_CONFIG='{"prio:98}'
DEVICETYPE=TeamPort
BOOTPROTO=static
NAME=ens37
DEVICE=ens33
DEVICE=ens37
HWADDR=00:0c:29:bc:9e:a2
```
**To Bring the interface up**
 ```
 ifup team0
```
**To verify settings -- You should see both ports now.**
```
teamnl team0 ports
```

