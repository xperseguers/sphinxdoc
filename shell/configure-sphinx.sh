#!/bin/bash

WWWROOT=/var/www/typo3sphinx.dev

echo "Installing the TYPO3 Share font"
cd $WWWROOT/uploads/tx_sphinx/RestTools/LaTeX/font/
./convert-share.sh

if [ ! -f /usr/local/bin/t3xutils.phar ]; then
	echo "Installing TYPO3 Extension Utils"
	cd /usr/local/bin/
	sudo wget -q http://bit.ly/t3xutils -O t3xutils.phar
	sudo chmod +x t3xutils.phar
fi
t3xutils.phar updateinfo

EXTENSIONS="sphinx restdoc"
cd /tmp
for E in $EXTENSIONS; do
	if [ ! -d $WWWROOT/typo3conf/ext/$E ]; then
		V=$(t3xutils.phar info $E | tail -n 1 | awk '{ print $1 }')
		echo "Installing latest version of EXT:$E (v$V)"
		t3xutils.phar fetch $E $V
		sudo t3xutils.phar extract ${E}_${V}.t3x $WWWROOT/typo3conf/ext/$E
	fi
done

sudo ln -s /bin/tar /usr/local/bin/

echo "Enabling Install Tool"
sudo touch $WWWROOT/typo3conf/ENABLE_INSTALL_TOOL
