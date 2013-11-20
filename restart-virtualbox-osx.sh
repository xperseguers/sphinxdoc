#!/bin/bash

if [ -f /Library/StartupItems/VirtualBox/VirtualBox ]; then
	sudo /Library/StartupItems/VirtualBox/VirtualBox restart
else
	sudo launchctl load /Library/LaunchDaemons/org.virtualbox.startup.plist
fi
