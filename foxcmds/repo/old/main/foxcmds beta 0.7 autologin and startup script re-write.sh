#!/bin/bash
#before start setup

conf_ver=0
cmdsver=beta_0.4
privatever=private
echo [------ fox commands script ------]
echo {-- version: $cmdsver - $privatever --}
echo ''

#start of start

#source 

until false
do
#manual login, go down to past comments for auto-login.
#if [ $autologin == true ]
#	then
#		
#		echo ''
#	echo welcome, $name
#	echo checking username...
#	configs
#	homedir="/home/$name"
#	if [ -d "$homedir" ]
#	then 
#		echo found homedir
#		break
#	else
#		echo "couldn't find homedir, please enter the username you are currently logged in to."
#	fi
#	else
#	read -p "linux-login: " name
#	#read -s -p "password:" passw
#	echo ''
#	echo welcome, $name
#	echo checking username...
#	#configs
#	homedir="/home/$name"
#	if [ -d "$homedir" ]
#	then 
#		echo found homedir
#		break
#	else
#		echo "couldn't find homedir, please enter the username you are currently logged in to."
#	fi
#fi

#autologin
sleep 1

name=$(logname)
#name=testname
	echo ''
	echo welcome, $name
	echo checking username...
	sleep 0.4
	#configs
	homedir="/home/$name"
	if [ -d "$homedir" ]
	then 
		echo found homedir
		sleep 0.3
		break
	else
		echo can not find homedir, please enter your linux username.
	until false
	do
	read -p "linux-login: " name
	#read -s -p "password:" passw
	echo ''
	echo welcome, $name
	echo checking username...
	#configs
	homedir="/home/$name"
	if [ -d "$homedir" ]
	then 
		echo found homedir
		sleep 0.1
		break
	else
		echo "couldn't find homedir, please enter the username you are currently logged in to."
	fi
	done
	break	
	fi



done

cd $homedir/.foxcmds
if [ -f "config.cfg" ]
then
	echo reading configs...
	sleep 0.3
	source config.cfg
	if [ $conf_ver -ge 1 ]
	then
	echo config version: $conf_ver
	else
	sure=''
	
	until false
	do
	read -p "config not up to date, update it now? [y/N] " sure
	if [ $sure == y ]
	then
		echo updating config...
		rm config.cfg
		wget -O $homedir/.foxcmds/config.cfg "https://drive.google.com/uc?export=download&id=161u5leuZLLHVzwYvY--cA3ZPY_jTbF5x"
		echo done
		break
	elif [ $sure == n ]
	then
		echo "not updating config... this could result into certain commands not working. if you encounter errors, please restart foxcmds and enter Y on this question."
		break
	else
		echo please enter y or n
	fi
	done
	fi
else
	echo entering first-run-setup
	sure=''
	read -p "are you sure you want to complete setup? this wil download a few files and create some folders. [y/N]" sure
	if [ $sure == y ]
	then
		
		wget -O $homedir/.foxcmds/logo.xpm "https://drive.google.com/uc?export=download&id=161tO86T0l0zzYeAR-3mV8RvTAvDP7HnH"
		wget -O $homedir/.foxcmds/config.cfg "https://drive.google.com/uc?export=download&id=161u5leuZLLHVzwYvY--cA3ZPY_jTbF5x"
		echo done
	else
	echo setup stopped.
	echo cant run without configs, exiting...
	echo exit
	exit
	fi
fi

cd $homedir
#read -p "want a clean promt? [y/N]" cleancmd
echo ''
sleep 0.1

#if [ $cleancmd == y ]
#	then
#	clear
#	echo [------ fox commands script ------]
#	echo {-- version: $cmdsver - $privatever --}
#	echo ''
#	#echo login: $name
#	#echo ''
#	echo welcome, $name
#	#echo want a clean promt? [y/N] $cleancmd
#fi

#end of start
#functions


#foxcmds
while :
do
#Reset al args
input=''
arg=''
arg1=''
arg2=''
arg3=''
arg4=''
cmdfnd=false

read -p "$name@foxpromt: " input arg arg1 arg2 arg3 arg4

if [ $input == test1 ]
    then
    	cmdfnd=true
    	#
        echo test1
    
    	     
fi
if [ $input == test2 ]
    then
    	cmdfnd=true
    	#
        echo test2
    
    	

fi
if [ $input == exit ]
    then
    	cmdfnd=true
    	#
        echo exit
        exit
    
    	
fi
if [ $input == clear ]
	then
    	cmdfnd=true
    	#
		clear
		echo '[------ fox commands script ------]'
		echo '{-- version: $cmdsver - $privatever --}'
		echo ''
fi
if [ $input == sudo ]
	then
	if [ $arg == su ]
	then
    	cmdfnd=true
    	#
	#echo sudo is not supported yet. coming soon!
	sudo su
	cd $userdir
	fi
fi
if [ $input == echo ]
	then
    	cmdfnd=true
    	#
	echo $arg $arg1 $arg2 $arg3 $arg4
fi
if [ $input == debug ]
	then
    	cmdfnd=true
    	#
	echo debugger
	echo input=$input arg=$arg arg2=$arg2 arg3=$arg3 arg4=$arg4
fi
if [ $input == opera ]
	then
	cmdfnd=true
	#
	foo=bar opera
fi


#poweroptions
if [ $input == poweroff ]
	then
    	cmdfnd=true
    	#
	read -p "are you sure you want to poweroff your computer?? all processes wil be killed. [y/N] " sure
	if [ $sure == y ]
	then
		poweroff
	else
	echo cancel
	sure=''
	fi
fi
if [ $input == restart ]
	then
    	cmdfnd=true
    	#
	read -p "are you sure you want to restart your computer? all processes wil be killed. [y/N] " sure
	if [ $sure == y ]
	then
		poweroff
	else
	echo cancel
	sure=''
	fi
fi


#setup
if [ $input == setup ]
    then	
	read -p "are you sure you want to reset al configs? this wil wipe al data in $homedir/.foxcmds. then it wil download a few files and create some folders. [y/N]" sure
	if [ $sure == y ]
	then
		cmdfnd=true
		###########
		rm $homedir/.foxcmds/logo.xpm
		rm $homedir/.foxcmds/config.cfg
		#rm $homedir/.foxcmds
		
		
		wget -O $homedir/.foxcmds/logo.xpm "https://drive.google.com/uc?export=download&id=161tO86T0l0zzYeAR-3mV8RvTAvDP7HnH"
		wget -O $homedir/.foxcmds/config.cfg "https://drive.google.com/uc?export=download&id=161u5leuZLLHVzwYvY--cA3ZPY_jTbF5x"
		echo done
	else
	cmdfnd=true
	echo setup stopped.
	fi
fi

#remove
#no script yet, first making the installer





#notfound
if [ $cmdfnd == false ]
    then
        echo cmd not found
fi
done

