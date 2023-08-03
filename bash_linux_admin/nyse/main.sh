host_name=`hostname`

nic_ip(){
interfaces=`ip a | grep inet | egrep -v 'inet6| lo' | awk '{print $2 " " $4 " " $9}'`
printf  "$interfaces\n"
}

nic_hardware(){
nichardware=`lshw -class network | egrep 'product|logical name|capacity'`
printf "$nichardware"
}

display_network_info() {
clear
echo "#############################"
echo "Displaying Network Setup info"
nic_ip > network_ip_info_log
nic_hardware > network_hardware_log
cat network_ip_info_log network_hardware_log
}

display_network_info
