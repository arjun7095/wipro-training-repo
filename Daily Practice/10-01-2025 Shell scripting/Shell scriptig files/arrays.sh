names=[]

names[0]="king"
names[1]="tom"
names[2]="smith"
names[3]="Arjun"

echo ${names[*]}

#Using for loop
for x in ${names[*]}
do
	echo $x
done

#Using while loop
i=0
while [ $i -lt 3 ]
do
	echo ${names[$i]}
	i=` expr $i + 1 `
done

