################file_server_config#######################
server_hook=`cat remote_server_hook`
host_name=$HOSTNAME
server_hook_ip_grab=`cat remote_server_hook`
server_hook_ip=`ping -c1 $server_hook_ip_grab | grep -ir  'PING' | awk '{print $3}' | tr -d '()' | head -n 1`
echo "I am host  " $host_name
## file_server_config
DPATH=`grep -ir  $host_name file_server_config  | awk -F"," '{print $2}'`



echo  "My Path is"  $DPATH > path



#Creates backups ("file".backup) of the files to be changed. The backups are created in the same dir where the original file is found.
find $DPATH -type f -exec grep -lr -e  "$server_hook" '{}' ';' -exec cp '{}' '{}.backup' ';'
find $DPATH -type f -exec grep -lr -e  "$server_hook_ip" '{}' ';' -exec cp '{}' '{}.backup' ';'

#This is for testing purposes. We are only replacing the servername/ip with it self on the remote servers to check time stamp.

#Set1 with Double Quotes in SED
find $DPATH -type f -not -name "*.backup" | xargs grep -lr -e $server_hook | xargs sed -i 's/'"$server_hook"'/'"$server_hook"'/g'
find $DPATH -type f -not -name "*.backup" | xargs grep -lr -e $server_hook_ip | xargs sed -i 's/'"$server_hook_ip"'/'"$server_hook_ip"'/g'

#Set1 with out Double Quotes in SED
find $DPATH -type f -not -name "*.backup" | xargs grep -lr -e $server_hook | xargs sed -i 's/'$server_hook'/'$server_hook'/g'
find $DPATH -type f -not -name "*.backup" | xargs grep -lr -e $server_hook_ip | xargs sed -i 's/'$server_hook_ip'/'$server_hook_ip'/g'

#This will replace the localhost name on the remote servers with the new localhost name.
#find $DPATH -type f -not -name "*.backup" | xargs grep -lr -e $server_hook | xargs sed -i 's/'$server_hook'/cckibus01/g'
#find $DPATH -type f -not -name "*.backup" | xargs grep -lr -e $server_hook_ip | xargs sed -i 's/'$server_hook_ip'/NYSEHOUSE/g'


