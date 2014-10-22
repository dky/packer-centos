#!/bin/bash

PACKERCMD=/usr/local/packer/packer
VAGRANTCMD=/usr/bin/vagrant

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, specify 5 or 6"
fi

build () {

	echo "Building $1"

	BOXNAME1="$1-32"
	BOXNAME2="$1-64"

	#clean up output if exist
	rm -rf ./output-*

	#Build the boxes
	$PACKERCMD build template.$1.json

	#Delete existing vagrant boxes
	$VAGRANTCMD box remove $BOXNAME1
	$VAGRANTCMD box remove $BOXNAME2

	$VAGRANTCMD box add $BOXNAME1 packer_"$BOXNAME1"_vmware.box
	$VAGRANTCMD box add $BOXNAME2 packer_"$BOXNAME2"_vmware.box

	#Remove the boxes
	rm -f ./*.box
}

case "$1" in
	5) echo "centos$1" 
	box_type="centos$1"
	build $box_type
	;;

	6) echo "centos$1" 
	box_type="centos$1"
	build $box_type
	;;
	*) echo 'you gave something else' ;;
esac
