echo [------ fox commands script ------]
echo {-- version: beta 0.3 - private --}


read -p "login: " name
#read -s -p "password:" passw
echo ''
echo welcome, $name
read -p "want a clean promt? [y/N]" cleancmd
sleep 1
if [ $cleancmd == y ]
	then
	clear
	echo login: $name
	echo ''
	echo welcome, $name
	echo want a clean promt? [y/N] $cleancmd
fi

#functions


#foxcmds
while :
do
read -p "$name@foxpromt: " input arg arg2 arg3 arg4

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
fi
if [ $input == sudo ]
	then
	#echo sudo is not supported yet. coming soon!
	sudo su
	cd ~
fi



#notfound
#if : []
#    then
#        echo cmd not found
#fi
done

