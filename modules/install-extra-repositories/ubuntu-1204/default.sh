#!/bin/bash
# Optimise Default Repositories

# Ask If Repositories Should Be Optimised
if question --default yes "Do you want to optimise the default repositories? Warning, this replaces the default repository list! (Y/n)" || [ $UNATTENDED = 1 ]; then
	subheader "Optimising Default Repositories..."

	# Check Mirror
	if [ $(read_variable_module_variable mirror_$DISTRIBUTION_$VERSION) = 0 ]; then
		# Set Mirror
		MIRROR="http://us.archive.ubuntu.com/ubuntu/"
	else
		# Set Mirror
		MIRROR=$(read_variable_module_variable mirror_$DISTRIBUTION_$VERSION)
	fi

	# Update Precise Repository
	echo "deb $MIRROR precise main restricted universe multiverse" > /etc/apt/sources.list

	# Update Precise Updates Repository
	echo "deb $MIRROR precise-updates main restricted universe multiverse" >> /etc/apt/sources.list

	# Update Precise Security Repository
	echo "deb $MIRROR precise-security main restricted universe multiverse" >> /etc/apt/sources.list
fi
