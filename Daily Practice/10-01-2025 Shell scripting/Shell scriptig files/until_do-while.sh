n=0

until [ $n -eq 1 ]
do
	ps -a
	sleep 2
	n=` expr $m + 1 `;
done

