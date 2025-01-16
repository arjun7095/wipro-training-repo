echo "Enter your age"
read age

if [ $age -gt 18 ]; then
	echo "You are eligible for vote"
else
	echo "you are not eligible for vote"
fi
