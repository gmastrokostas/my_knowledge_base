### cgroupsv2 general info
- systemd is the parent process where in contrast in Linux the parent process is PID 1.

- With cgroupsv2 you can have multople hierarcies of cgroups. In Linux you have one hierarchy.

- cgroups inherint their attributes from their parent which is the same with traditional Linux usage.

- In cgroups a task cannot escape a cgroup where in traditional Linux usage a process can be forked and escape.

- systemd uses cgroups to manage processes. This means any changes made with systemd will affect the processes as a group.

- cgroups can be set in Unit files and contain tasks from multiple users.

- With cgroupsv2 you can create checkpoints, snapshots.

