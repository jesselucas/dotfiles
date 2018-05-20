#! /bin/sh -
#
#	Simple script to ease switching wifi
#	Assumes there is a hostname.iwm0 for
#	each location.
#
#	Should be ran with doas.

# Define valid iwm0 locations.
LOCATION[0]="home"
LOCATION[1]="work"

# Usage message.
USAGE="Usage: Argument must be a valid location: ${LOCATION[*]}"

# Make sure a valid place is passed as an argument.
if [ -z "$1" ] || [ "$1" == " " ]; then
	echo $USAGE
	return
fi

# Verify $1 is a valid location.
FOUND=false
for l in "${LOCATION[@]}"
do
	if [ "$l" == "$1" ] ; then
		FOUND=true
	fi
done

if [ "$FOUND" == false ]; then
	echo "Invalid location: $1"
	echo $USAGE
	return
fi

cp /etc/hostname.iwm0.$1 /etc/hostname.iwm0
sh /etc/netstart iwm0
