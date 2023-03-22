counter=0
for loop in $(seq 5)
do
	let counter++
	echo $counter
done

array_1=("$@")
for items in ${array_1[@]};
do
        echo $items
done
echo ${array_1[0]};
