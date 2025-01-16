echo "enter a value"
read a
 
echo "enter b value"
read b

echo "enter c value"
read c

if [ $a  -gt  $b ];  then
	echo "a is greater than b"
elif  [ $a -gt $c ]; then
	echo "a is greater than c"
else
	echo "a is not greater than b or c"
fi
