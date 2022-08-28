cmdsver=beta_0.5
privatever=private
echo [------ fox commands script ------]
echo {-- version: $cmdsver - $privatever --}
echo ''


read -p "login: " name
#read -s -p "password:" passw
echo ''
echo welcome, $name
read -p "want a clean promt? [y/N]" cleancmd
sleep 1
if [ $cleancmd == y ]
	then
	clear
	echo [------ fox commands script ------]
	echo {-- version: $cmdsver - $privatever --}
	echo ''
	echo login: $name
	echo ''
	echo welcome, $name
	echo want a clean promt? [y/N] $cleancmd
fi

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

read -p "$name@foxpromt: " input arg arg1 arg2 arg3 arg4

if [ $input == test1 ]
    then
    	test1=true
    	#
        echo test1
    else
    	test1=false      
fi
if [ $input == test2 ]
    then
    	test2=true
    	#
        echo test2
    else
    	test2=false

fi
if [ $input == exit ]
    then
    	exit=true
    	#
        echo exit
        exit
    else
    	exit=false
fi
if [ $input == clear ]
	then
		clear
		echo '[------ fox commands script ------]'
		echo '{-- version: $cmdsver - $privatever --}'
		echo ''
fi
if [ $input == sudo ]
	then
	#echo sudo is not supported yet. coming soon!
	sudo su
	cd ~
fi
if [ $input == echo ]
	then
	foo=bar echo $arg $arg1 $arg2 $arg3 $arg4
fi
if [ $input == debug ]
	then
	echo debugger
	echo input=$input arg=$arg arg2=$arg2 arg3=$arg3 arg4=$arg4
fi



#poweroptions
if [ $input == poweroff ]
	then
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
	read -p "are you sure you want to restart your computer? all processes wil be killed. [y/N] " sure
	if [ $sure == y ]
	then
		poweroff
	else
	echo cancel
	sure=''
	fi
fi

#notfound
#if : []
#    then
#        echo cmd not found
#fi
done

