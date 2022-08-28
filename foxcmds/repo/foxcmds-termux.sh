#!/data/data/com.termux/files/bin/bash
#before start setup
cddir=''
conf_ver=0
cmdsver=beta_0.4
privatever=private
cd /data/data/com.termux/files/.vosjedev/foxcmds
./startfox.sh
cd /data/data/com.termux/files/
clear
echo [------ fox commands script ------]
echo {-- version: $cmdsver - $privatever --}
echo ''
cddirdis=~

#start of start



 

until false
do
#manual login, go down to past comments for auto-login.
#if [ $autologin == true ]
#	then
#		
#		echo ''
#	echo welcome, $name
#	echo checking username...
#	#configs
#	homedir="/data/data/com.termux/files/home"
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
#	homedir="/data/data/com.termux/files/home"
#	if [ -d "$homedir" ]
#	then 
#		echo found homedir
#		break
#	else
#		echo "couldn't find homedir, please enter the username you are currently logged in to."
#	fi
#fi

#autologin


name=$(logname)
#name=testname
	echo ''
	echo welcome, $name
	echo checking username...
	
	#configs
	homedir="/data/data/com.termux/files/home"
	if [ -d "$homedir" ]
	then 
		echo found homedir
		
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
	homedir="/data/data/com.termux/files/home"
	if [ -d "$homedir" ]
	then 
		echo found homedir
		
		break
	else
		echo "couldn't find homedir, please enter the username you are currently logged in to."
	fi
	done
	break	
	fi



done

#test for wget
if [ ! -x /data/data/com.termux/files/usr/bin/wget ]
then
	echo wget is not installed. this means foxcmds cant download any files, and therefore not update, or complete setup. if you get a confirmation message that foxcmds needs to download files, please make sure wget is installed.
fi

cd $homedir/.foxcmds
if [ -f "config.cfg" ]
then
	echo reading configs...
	
	source config.cfg
	if [ $conf_ver -ge 3 ]
	then
	echo config version: $conf_ver
	if [ $echoconfig == true ]
	then
	echo "config data:
===========================
always_execute_unknown_commands=$always_execute_unknown_commands
place_content_off_the_edge=true$place_content_off_the_edge
===========================
set echoconfig to false to disable this"
	fi
	else
	sure=''
	
	until false
	do
	read -p "config not up to date, update it now? the config will be backed up. you wil need to apply your changes to the config afterwards. [y/N] " sure
	if [ $sure == y ]
	then
		echo updating config...
		rm old_config.cfg
		mv config.cfg old_config.cfg
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
		cd $homedir
		mkdir .foxcmds
		wget -O /.vosjedev/foxcmds/logo.xpm "https://drive.google.com/uc?export=download&id=161tO86T0l0zzYeAR-3mV8RvTAvDP7HnH"
		wget -O $homedir/.foxcmds/config.cfg "https://drive.google.com/uc?export=download&id=161u5leuZLLHVzwYvY--cA3ZPY_jTbF5x"
		cd .foxcmds
		touch history.txt
		mkdir plugins
		cd plugins
		#wget -O $homedir/.foxcmds/plugins/plugins.sh 
		chmod +x plugins.sh
		touch cmdfnd.src
		cd..
		
		
		
		echo done
	else
	echo setup stopped.
	echo cant run without configs, press enter to exit
	read -p
	echo exit
	exit
	fi
fi

cd $homedir
cddirdis='~'
#read -p "want a clean promt? [y/N]" cleancmd
echo ''


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

cddir=$homedir
#foxcmds
##inputprompt
while :
do
if [ "$place_content_off_the_edge" == true ]
then
echo -n '  '
fi
#Reset al args
#input=''
#arg=''
#arg1=''
#arg2=''
#arg3=''
#arg4=''
cmdfnd=false
if [ "$prev" == true ]
then
	if [ "$hisnr" == 1 ]
	then
		read -e -i "$history" -p "$name@foxpromt $cddirdis: " input arg arg1 arg2 arg3 arg4
	fi
	if [ "$hisnr" == 2 ]
	then
		read -e -i "$history1" -p "$name@foxpromt $cddirdis: " input arg arg1 arg2 arg3 arg4
	fi
	if [ "$hisnr" == 3 ]
	then
		read -e -i "$history2" -p "$name@foxpromt $cddirdis: " input arg arg1 arg2 arg3 arg4
	fi
	if [ "$hisnr" == 4 ]
	then
		read -e -i "$history3" -p "$name@foxpromt $cddirdis: " input arg arg1 arg2 arg3 arg4
	fi
	if [ "$hisnr" == 5 ]
	then
		read -e -i "$history4" -p "$name@foxpromt $cddirdis: " input arg arg1 arg2 arg3 arg4
	fi
	if [ "$hisnr" == 6 ]
	then
		read -e -i "$history5" -p "$name@foxpromt $cddirdis: " input arg arg1 arg2 arg3 arg4
	fi
	if [ "$hisnr" -ge 7 ]
	then
		echo you can only go back 6 commands. previous commands are saved in $homedir/.foxcmds/history.txt
		while true
		do
		sure=''
		read -p "Open history log? [y/n]" sure
		if [ $sure == y ]
		then
			cp $homedir/.foxcmds/history.txt $homedir/.foxcmds/historyview.txt 
			nano -m +-1 $homedir/.foxcmds/historyview.txt
			rm $homedir/.foxcmds/historyview.txt
			read -e -p "$name@foxpromt $cddirdis: " input arg arg1 arg2 arg3 arg4
			break
		elif [ $sure == n ]
		then
			read -e -p "$name@foxpromt $cddirdis: " input arg arg1 arg2 arg3 arg4
			break
		else
		echo please enter y/n
		fi
		done
	fi
#elif [ "$next" == true ]
#then
#	read -e -i "'$'" -p "$name@foxpromt $cddirdis: " input arg arg1 arg2 arg3 arg4
else
	#for prev
	#history
	history5="$history4"
	history4="$history3"
	history3="$history2"
	history2="$history1"
	history1="$history"
	history="$input $arg $arg1 $arg2 $arg3 $arg4"
	echo "$history" >> $homedir/.foxcmds/history.txt
	#Reset al args
	input=''
	arg=''
	arg1=''
	arg2=''
	arg3=''
	arg4=''
	read -e -p "$name@foxpromt $cddirdis: " input arg arg1 arg2 arg3 arg4
fi
prev=''
next=''
if [ "$place_content_off_the_edge" == true ]
then
echo -n '  '
fi
#commands under here

if [ "$input" == test1 ]
    then
    	cmdfnd=true
    	#
        echo test1
    
    	     
fi
if [ "$input" == test2 ]
    then
    	cmdfnd=true
    	#
        echo test2
    
    	

fi
if [ "$input" == exit ]
    then
    	cmdfnd=true
    	#
        echo cleaning...
        break
    
    	
fi
if [ "$input" == clear ]
	then
    	cmdfnd=true
    	#
		clear
		echo '[------ fox commands script ------]'
		echo {-- version: $cmdsver - $privatever --}
		echo ''
		#
		if [ "$arg" == ";" ]
		then
			$arg1 $arg2 $arg3 $arg4
		fi
fi
if [ "$input" == sudo ]
	then
	if [ $arg == su ]
	then
    	cmdfnd=true
    	#
	#echo sudo is not supported yet. coming soon!
	sudo $arg $arg1 $arg2 $arg3 $arg4
	cd $userdir
	fi
fi
#if [ "$input" == echo ]
#	then
#    	cmdfnd=true
#    	#
#	echo $arg $arg1 $arg2 $arg3 $arg4
#fi
if [ "$input" == debug ]
	then
    	cmdfnd=true
    	#
	echo debugger
	echo input="$input" arg=$arg arg2=$arg2 arg3=$arg3 arg4=$arg4
fi
if [ "$input" == opera ]
	then
	cmdfnd=true
	#
	foo=bar opera
fi


#poweroptions
if [ "$input" == poweroff ]
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
if [ "$input" == restart ]
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
if [ "$input" == setup ]
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
if [ "$input" == cd ]
then
	cmdfnd=true
	#
	if [ $arg == "~" ]
	then
		cd $homedir
		cddir='~'
	else
		if [ -d $arg ]
		then
		cd $arg
		cddirdis=$arg
		cddir=$(pwd)
		else
		echo Directory $arg does not exists. Make sure you mounted the right directory
		fi
	fi
fi
#next and prev
if [ "$input" == prev ]
then
	cmdfnd=true
	prev=true
	if [ "$hisnr" == '' ]
	then
	echo no number specified. using prev 1.
	hisnr=1
	else
	hisnr=$arg
	fi
#elif [ "$input" == next ]
#then
#	cmdfnd=true
#	next=true
fi
#plugins

cd $homedir/.foxcmds
cd plugins
export homedir=$homedir
export input="$input"
export arg=$arg
export arg1=$arg1
export arg2=$arg2
export arg3=$arg3
export arg4=$arg4
export name=$name
export cddir=$cddir
export cddirdis=$cddirdis
export cmdsver=$cmdsver
./plugins.sh
if [ $cddir == "~" ]
then
	cd $homedir
	cddirdis='~'
else
	cd $cddir
	cddir=$cddir
fi

#remove
#no script yet, first making the installer



#is command found in plugins?
source $homedir/.foxcmds/plugins/cmdfnd.src
#notfound
if [ $cmdfnd == false ]
    then
        sure=''
        if [ $always_execute_unknown_commands == false ]
        then
        	echo cmd not found
        	read -p "execute it in a normal terminal? [y/n]" sure
        	if [ $sure == y ]
        	then
				if [ -f /data/data/com.termux/files/usr/bin/"$input" ]
				then
        			"$input" $arg $arg1 $arg2 $arg3 $arg4
				else
					echo "command $input not found. Is it in /usr/bin and executable? If you are setting a variable, please use 'var variablename value'"
				fi       	
        	fi
        else
        	if [ -f /data/data/com.termux/files/usr/bin/"$input" ]
			then
        		$input $arg $arg1 $arg2 $arg3 $arg4
			else
				echo "command $input not found. Is it in /usr/bin and executable? If you are setting a variable, please use 'var variablename value'"
			fi
        fi
fi
rm $homedir/.foxcmds/plugins/cmdfnd.src
touch $homedir/.foxcmds/plugins/cmdfnd.src
done
rm $homedir/.foxcmds/plugins/cmdfnd.src
touch $homedir/.foxcmds/plugins/cmdfnd.src
echo exit
exit
