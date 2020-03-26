#!/bin/bash

BLACKLIST=/etc/ipset-blacklist.txt

# CHECK FOR DUPLICATES
if grep -xq "$1" $BLACKLIST ; then
        echo "Already in $BLACKLIST";
        exit;
fi

# VALIDATE IP OR SUBNET
sudo ipcalc -cs $1 && VALID="yes" || VALID="no";

if [ "$VALID" = "yes" ]; then
        echo "Adding entry to $BLACKLIST";
        sudo echo $1 >> $BLACKLIST
        echo -n "Adding entry to ipset: ";
        sudo firewall-cmd --permanent --ipset=blacklist --add-entries-from-file=$BLACKLIST

        if [ ! "$2" == "-noreload" ]; then
                echo -n "Reloading firewall: ";
                sudo firewall-cmd --reload
        fi
else
        echo "Invalid IP or subnet";
fi
