str="Arjun"

if test -n str; then
	echo "$str is not null"
fi

str2=""

if [ -z $str2 ]; then
	echo "string $str2 is null"
else
	echo "String $str2 is not null"
fi

