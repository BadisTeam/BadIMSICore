#!/bin/bash

coredir=/opt/BadIMSIBox/BadIMSICore
srcdir=$coredir/src
linkrootdir=/usr/local/sbin
linkdir=/usr/local/bin




function install(){
	sudo mkdir $coredir
	sudo cp -r ./src $coredir
	sudo cp -r ./resources $coredir
	
	sudo chmod 711 $srcdir/badimsicore_listen.py            $linkrootdir/badimsicore_listen
	sudo chmod 711 $srcdir/badimsicore_openbts.py           $linkrootdir/badimsicore_openbts
	sudo chmod 755 $srcdir/airprobe_rtlsdr_non_graphical.py $linkdir/airprobe_rtlsdr_non_graphical
	sudo chmod 755 $srcdir/badimsicore_sms_interceptor.py   $linkdir/badimsicore_sms_interceptor
	sudo chmod 755 $srcdir/badimsicore_sms_sender.py        $linkdir/badimsicore_sms_sender
	sudo chmod 755 $srcdir/badimsicore_tmsis.py             $linkdir/badimsicore_tmsis
	
	sudo ln -s $srcdir/badimsicore_listen.py            $linkrootdir/badimsicore_listen
	sudo ln -s $srcdir/badimsicore_openbts.py           $linkrootdir/badimsicore_openbts
	sudo ln -s $srcdir/airprobe_rtlsdr_non_graphical.py $linkdir/airprobe_rtlsdr_non_graphical
	sudo ln -s $srcdir/badimsicore_sms_interceptor.py   $linkdir/badimsicore_sms_interceptor
	sudo ln -s $srcdir/badimsicore_sms_sender.py        $linkdir/badimsicore_sms_sender
	sudo ln -s $srcdir/badimsicore_tmsis.py             $linkdir/badimsicore_tmsis
}

function clean(){
	sudo rm -rf $coredir
	sudo rm -rf $linkdir/badimsicore_*
	sudo rm -rf $linkrootdir/badimsicore_*
}

clean
install
