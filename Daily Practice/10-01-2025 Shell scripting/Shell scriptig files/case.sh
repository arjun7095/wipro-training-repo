echo "Enter your choice"
read choice

case $choice in
	1) ls -l ;;
	2) ps -f ;;
	3) date ;;
	4) logname ;;
	5) pwd ;;
	*) echo "Invalid option, try again"
esac
