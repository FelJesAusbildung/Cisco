#!/bin/bash
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root."
	exit 1
fi

if [[ $# -eq 2 ]]; then
	NAME=$1
	GROUP=$2
else
	echo "Correct Syntax is: setup [NAME] [GROUP]"
	exit 1
fi


groupadd $GROUP 2> ./setup.log
if [[ $? -ne 0 ]]; then
	echo "Group already exists. Try another Groupname."
	exit 1
fi


useradd -s /bin/bash -g $GROUP $NAME 2> ./setup.log
if [[ $? -ne 0 ]]; then
	echo "User already exists. Try another Username."
	groupdel $GROUP
	echo "Group was deleted to avoid clutter."
	exit 1
fi

echo "Please enter a Password."
while [[ -z $PASSWD ]]; do
	if [[ $I -gt 1 ]]; then
		echo "Enter a non-empty Password."
	fi
	read PASSWD
	I=$I+1
done
echo "$NAME:$PASSWD" | chpasswd

echo "(User : Group) is ($(groups $NAME))"

mkdir /$NAME 2> ./setup.log
if [[ $? -ne 0 ]]; then
	echo "Directory for $NAME already exists. Ownership was not changed to avoid issues."
else
	chown $NAME:$GROUP /$NAME
	chmod 1770 /$NAME
fi
echo "Directory is ($(ls -dl /$NAME))"
