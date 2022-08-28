#! /bin/bash

echo preparing
echo testing if script is run as sudo
cd /
touch testfile.txt
if [ -f testfile.txt ]
then
	rm testfile.txt
else
   	echo please run me as root or using sudo. press any key to exit.
	read -s -n 1 exitvar 
	exit 1
fi

while true
do
#searching homedir
echo finding username
name=$(logname)
#name=testname
	if [ "$name" == '' ]
	then
		echo name = nothing...
		while true
		do
			read -p "linux-login: " name
			#read -s -p "password:" passw
			echo ''
			echo welcome, $name
			echo checking username...
			# is homedir a directory
			homedir="/home/$name"
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
	echo ''
	echo welcome, $name
	echo checking username...
	# is homedir a directory
	homedir="/home/$name"
	if [ -d "$homedir" ]
	then 
		echo found homedir
		break
	else
		echo can not find homedir, please enter your linux username.
	while true
	do
	read -p "linux-login: " name
	#read -s -p "password:" passw
	echo ''
	echo welcome, $name
	echo checking username...
	# is homedir a directory
	homedir="/home/$name"
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
#end of username finding	

echo "testing if wget is installed..."
if [ ! -x /usr/bin/wget ]
then
	echo wget is not installed. this means foxcmds setup cant download any files, so also not foxcmds script. please make sure wget is installed and try again.
	read -s -n 1 -p "press any key to exit"
	exit
fi

while false
do
read -p "are you sure you want to install fox command promt? this wil start the downloads now. [y/n]" sure
if [ $sure == y ]
then
	break
elif [ $sure == n ]
then
	echo exiting...
	exit
else
	echo 'please enter y/n'
fi
done
echo testing if unzip is installed
if [ ! -x /usr/bin/unzip ]
then
echo please download the program unzip.
exit
else
echo found unzip functionality
fi

# /.vosjedev/foxcmds
cd /
if [ -d .vosjedev ]
then
echo thanks for downloading other vosjedev programs!
cd .vosjedev
echo found programs:
for file in $(ls -1)
do
echo -n "$file, "
echo ""
done
else
echo your first vosjedev program!
echo making .vosjedev folder
mkdir .vosjedev
cd .vosjedev
fi
mkdir foxcmds
cd foxcmds
echo downloading /.vosjedev/foxcmds files
echo ==============================================
wget -O foxcmds.zip "het-lachende-vosje-dev.on.drv.tw/foxcmds/repo/build/foxcmds.zip"
echo ==============================================
echo unzipping
unzip foxcmds.zip
echo removing zip file
rm foxcmds.zip

# /home/$(logname)/.foxcmds
echo changing directory to $homedir
cd $homedir
echo making .foxcmds folder
sudo -u $name mkdir .foxcmds
echo changing directory to $homedir/.foxcmds
cd .foxcmds
echo downloading $homedir/.foxcmds files
echo ==============================================
sudo -u $name wget -O .foxcmds.zip "het-lachende-vosje-dev.on.drv.tw/foxcmds/repo/build/.foxcmds.zip"
echo ==============================================
echo unzipping
sudo -u $name unzip .foxcmds.zip
echo removing zip file
rm .foxcmds.zip
echo some little changes...
cd plugins
chmod +x plugins.sh
echo done downloading, extracting, removing.
echo adding a start function to .bashrc
cd $homedir
echo "

function foxcmds {
	/.vosjedev/foxcmds/foxcmds.sh
}" >> .bashrc
echo done

#add foxcmds to program list
while true
do
read -p "do you want to add foxcmds to your program list? (for gui based distros) [y/n] " yesno
if [ "$yesno" == y ]
then
cd /usr/share/applications
touch foxcmds.desktop
echo "[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=fox cmds promt
Comment=a custom command promt.
Icon=/.vosjedev/foxcmds/logo.png
Exec=/.vosjedev/foxcmds/foxcmds.sh
Terminal=true
Categories=terminals" >>  foxcmds.desktop
echo added foxcmds to program list
break
elif [ "$yesno" == n ]
then
echo not adding, 
break
else
echo "$yesno is not a valid answer. type 'y' or 'n'"
fi
done

echo making foxcmds executable
chmod +x /.vosjedev/foxcmds/foxcmds.sh


#done
echo -========- done -========-

echo foxcmds is installed. you can run the script by typing foxcmds in an terminal, or choosing it from the program list. please restart your bash session to use foxcmds.
read -p "type s to start foxcmds, any other key exits." -n 1 yesno
if [ "$yesno" == y ]
then
foxcmds
fi
exit