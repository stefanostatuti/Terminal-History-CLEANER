#!/bin/bash
#------------------Configuration parameters---------------#
homeDir='/home/pi'
#--------------------End Configuration--------------------#
clear
echo "******************************************"
echo "*        Terminal History CLEANER        *"
echo "******************************************"
echo "* This script removes all duplicate      *"
echo "* entries from Terminal history          *"
echo "******************************************"
echo "*     Version 1.0  Stefano Statuti       *"
echo "******************************************"
echo " "
if [ ! -d $homeDir ]
then
    echo "ERROR: User's folder NOT found, exiting..."
else
    echo "Backupping Original bash History, sorting and writing in new One..."
    cp $homeDir/.bash_history $homeDir/.bash_history.old
    cat $homeDir/.bash_history | sort -u >> $homeDir/.bash_history_temp
    echo "Done."
    echo " "
    echo "Changing permissions ... "
    chmod 600 $homeDir/.bash_history_temp
    echo "Done."
    echo ""
    echo "Copying new and removing Old one..."
    rm $homeDir/.bash_history
    mv $homeDir/.bash_history_temp $homeDir/.bash_history
    echo "Done."
fi
echo "******************************************"
echo "*            Bye Bye     :)              *"
echo "******************************************"                                                      
