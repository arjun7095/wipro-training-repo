echo "Enter file name"
read file

if [ -s "$file" ]; then
	echo "File is found"
	if [ -r "$file" ]; then
		echo "and  readable"
	else
		echo "and not readable"
	fi
else
	echo "file not found"
fi
