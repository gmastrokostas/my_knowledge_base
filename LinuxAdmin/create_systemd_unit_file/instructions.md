### Creating a Systemd unit fileCreating a Systemd unit file

Full documentation for RedHat 8 is found here:
https://www.redhat.com/sysadmin/systemd-oneshot-service

We will create a simple bash script and then have it being managed by systemd. once the server goes into multiuser level.

Location of systemd service file: 
> /usr/lib/systemd/system/get_info.service

**Contents of service file
**
It will wait until anything specified in After is completed
After=multi-user.target network.target

> [Unit]
Description=Get generic system info


[Service]
Type=oneshot

If below option is not defined the state of the unit will go into dead
even though it run. Having set this to true
will keep the status of the unit as started
which may assist with the dependencies of other units
that may expect this service to be on a state of started

> RemainAfterExit=true

We can execute multiple commands as well.
> ExecStart=/bin/taskset -c 2-4 /usr/sbin/get_info.sh
ExecStart=/bin/bash -c "echo first" 
ExecStart=/bin/bash -c "echo second"

This section is needed when a service is enabled via systemctl
[Install]
WantedBy=multi-user.target


**What happens if we enable this service.**
Since it is needed by the “multi-user.target” a symlink will be created under
> /etc/Systemd/System/Multi-User.Target.Wants/etc/Systemd/System/Multi-User.Target.Wants

which will point to
> /usr/lib/systemd/system/get_info.service

[root@centos1 multi-user.target.wants]# pwd
/etc/systemd/system/multi-user.target.wants
[root@centos1 multi-user.target.wants]# ll get_info.service 
lrwxrwxrwx. 1 root root 40 Feb 27 11:57 get_info.service -> /usr/lib/systemd/system/get_info.service
RemainAfterExit impact.

**What we see if we do a systemctl status get_info.service**
● get_info.service - Get generic system info
   Loaded: loaded (/usr/lib/systemd/system/get_info.service; enabled; vendor preset: disabled)
   Active: active (exited) since Mon 2023-02-27 11:44:24 EST; 20min ago
 Main PID: 2278 (code=exited, status=0/SUCCESS)
    Tasks: 0 (limit: 4531)
   Memory: 0B
   CGroup: /system.slice/get_info.service


