#ENTER A SUBNET TO PING
echo "Enter range of ips"
read range
for octet in `seq 10 20`; do
	ping -c 1 $range.$octet >> /dev/null
	if [[ $? -eq 0 ]];
	then
		echo "server is up"
	else
		echo "server is down"
	fi;
done


####READ FILE MULTIPLE SUBNETS AND DO PING TEST
echo "Reading subnet from text file"
for range in `cat ip_range`; do
	echo $range
	for octet in `seq 10 20`;do
		ping -c 1 $range.$octet >> /dev/null
		if [[ $? -eq 0 ]];
		then
		echo $range.$octet server is up
	else
		echo $range.$octet server is down
		fi	
	done
done


