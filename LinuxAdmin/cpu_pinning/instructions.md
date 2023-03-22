**Isolate CPUs and assing them to a specific service/process.
**
- Instruct the kernel to isolate the CPUs you want by passing kernel args during boot.
> grubby --args="isolcpus=2-4" --update-kernel=ALL
>reboot

- Instruct your systemd unit file to start process under the CPUs you specified
Under the [Service] section set following parameter with taskset

> [Service]
Type=oneshot
RemainAfterExit=true\
ExecStart=/bin/taskset -c 2-4 /usr/sbin/get_info.sh