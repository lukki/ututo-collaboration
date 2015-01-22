#!/bin/bash

if [ -e /var/db/pkg.real ];then
    echo "Fixing packages database..."
    mv /var/db/pkg /var/db/pkg.kit
    mv /var/db/pkg.real /var/db/pkg
    echo "Done!"
fi

cp uses/package.use.ututo /usr/portage/profiles/base/package.use
./01-compile-i686.sh

ARQ="nocona"
PARM="-B"
RECOMPILA="R"  # X=Yes   R=No
ALTFLAGS="fast"
rm -rf /var/tmp/portage/*
cp makes.conf.fast/make.conf.$ARQ /etc/make.conf
while read PKG
do
    SIONO=`echo "$PKG" | grep "\[ebuild   $RECOMPILA"`
    if [ "$SIONO" = "" ];then
	#echo "Processing... $PKG"
	PKGX=`echo $PKG | cut -d "]" -f 2 | cut -d " " -f 2 | cut -d ":" -f 1`
	USEX3=`echo $PKG | cut -d "=" -f 2 | cut -d "\"" -f 2 | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//"`
	USEX2=`echo $USEX3 | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//"`
	USEXX=`echo $USEX2 | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//"`
	USEX=`echo $USEXX | sed "s/ssse3//" | sed "s/sse3//" | sed "s/sse4//" | sed "s/sse2//" | sed "s/sse//" | sed "s/mmx//" |  sed "s/3dnow//" `
	USEMAKE=`cat /etc/make.conf | grep USE | grep -v USE_ | cut -d "\"" -f 2`
	PKGX2=`echo $PKG | cut -d "]" -f 2 | cut -d " " -f 2 | cut -d "/" -f 2 | cut -d ":" -f 1`
	if [ -e packages/$ARQ/$PKGX2.tbz2 ];then
	    echo "Compilado... $PKGX"
	    #sleep 3
	else
	    if [ -e packages/i686/$PKGX2.tbz2 ];then
		clear
		echo "------------------------------------------------------------------"
		echo "Paquete: $PKGX ($PKGX2)"
		echo "USE: $USEMAKE $USEX"
		echo "------------------------------------------------------------------"
		echo " "
		echo " "
		echo " "
		echo " "
		cp makes.conf.fast/make.conf.$ARQ /etc/make.conf
		USE="$USEMAKE $USEX" emerge --nodeps $PARM =$PKGX
		if [ -e /usr/portage/packages/All/$PKGX2.tbz2 ];then
		    mkdir packages/$ARQ
		    mv /usr/portage/packages/All/*.tbz2 packages/$ARQ
		else
		    cp makes.conf/make.conf.$ARQ /etc/make.conf
		    USE="$USEMAKE $USEX" emerge --nodeps $PARM =$PKGX
		    if [ -e /usr/portage/packages/All/$PKGX2.tbz2 ];then
			mkdir packages/$ARQ
			mv /usr/portage/packages/All/*.tbz2 packages/$ARQ
		    else
			echo "Compilation Error in $PKGX"
			#sleep 1000000
		    fi
		fi
	    fi
	fi
    fi
done < compile.list/compile.list
# return to original
cp makes.conf/make.conf.i686 /etc/make.conf

cp uses/package.use.ututo /usr/portage/profiles/base/package.use

ARQ="atom"
rm -rf /var/tmp/portage/*
cp makes.conf.fast/make.conf.$ARQ /etc/make.conf
while read PKG
do
    SIONO=`echo "$PKG" | grep "\[ebuild   $RECOMPILA"`
    if [ "$SIONO" = "" ];then
	#echo "Processing... $PKG"
	PKGX=`echo $PKG | cut -d "]" -f 2 | cut -d " " -f 2 | cut -d ":" -f 1`
	USEX3=`echo $PKG | cut -d "=" -f 2 | cut -d "\"" -f 2 | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//"`
	USEX2=`echo $USEX3 | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//"`
	USEXX=`echo $USEX2 | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//"`
	USEX=`echo $USEXX | sed "s/ssse3//" | sed "s/sse3//" | sed "s/sse4//" | sed "s/sse2//" | sed "s/sse//" | sed "s/mmx//" |  sed "s/3dnow//" `
	USEMAKE=`cat /etc/make.conf | grep USE | grep -v USE_ | cut -d "\"" -f 2`
	PKGX2=`echo $PKG | cut -d "]" -f 2 | cut -d " " -f 2 | cut -d "/" -f 2 | cut -d ":" -f 1`
	if [ -e packages/$ARQ/$PKGX2.tbz2 ];then
	    echo "Compilado... $PKGX"
	    #sleep 3
	else
	    if [ -e packages/i686/$PKGX2.tbz2 ];then
		clear
		echo "------------------------------------------------------------------"
		echo "Paquete: $PKGX ($PKGX2)"
		echo "USE: $USEMAKE $USEX"
		echo "------------------------------------------------------------------"
		echo " "
		echo " "
		echo " "
		echo " "
		cp makes.conf.fast/make.conf.$ARQ /etc/make.conf
		USE="$USEMAKE $USEX" emerge --nodeps $PARM =$PKGX
		if [ -e /usr/portage/packages/All/$PKGX2.tbz2 ];then
		    mkdir packages/$ARQ
		    mv /usr/portage/packages/All/*.tbz2 packages/$ARQ
		else
		    cp makes.conf/make.conf.$ARQ /etc/make.conf
		    USE="$USEMAKE $USEX" emerge --nodeps $PARM =$PKGX
		    if [ -e /usr/portage/packages/All/$PKGX2.tbz2 ];then
			mkdir packages/$ARQ
			mv /usr/portage/packages/All/*.tbz2 packages/$ARQ
		    else
			echo "Compilation Error in $PKGX"
			#sleep 1000000
		    fi
		fi
	    fi
	fi
    fi
done < compile.list/compile.list
# return to original
cp makes.conf/make.conf.i686 /etc/make.conf

cp uses/package.use.ututo /usr/portage/profiles/base/package.use

ARQ="sempron"
rm -rf /var/tmp/portage/*
cp makes.conf.fast/make.conf.$ARQ /etc/make.conf
while read PKG
do
    SIONO=`echo "$PKG" | grep "\[ebuild   $RECOMPILA"`
    if [ "$SIONO" = "" ];then
	#echo "Processing... $PKG"
	PKGX=`echo $PKG | cut -d "]" -f 2 | cut -d " " -f 2 | cut -d ":" -f 1`
	USEX3=`echo $PKG | cut -d "=" -f 2 | cut -d "\"" -f 2 | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//"`
	USEX2=`echo $USEX3 | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//"`
	USEXX=`echo $USEX2 | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//"`
	USEX=`echo $USEXX | sed "s/ssse3//" | sed "s/sse3//" | sed "s/sse4//" | sed "s/sse2//" | sed "s/sse//" | sed "s/mmx//" |  sed "s/3dnow//" `
	USEMAKE=`cat /etc/make.conf | grep USE | grep -v USE_ | cut -d "\"" -f 2`
	PKGX2=`echo $PKG | cut -d "]" -f 2 | cut -d " " -f 2 | cut -d "/" -f 2 | cut -d ":" -f 1`
	if [ -e packages/$ARQ/$PKGX2.tbz2 ];then
	    echo "Compilado... $PKGX"
	    #sleep 3
	else
	    if [ -e packages/i686/$PKGX2.tbz2 ];then
		clear
		echo "------------------------------------------------------------------"
		echo "Paquete: $PKGX ($PKGX2)"
		echo "USE: $USEMAKE $USEX"
		echo "------------------------------------------------------------------"
		echo " "
		echo " "
		echo " "
		echo " "
		cp makes.conf.fast/make.conf.$ARQ /etc/make.conf
		USE="$USEMAKE $USEX" emerge --nodeps $PARM =$PKGX
		if [ -e /usr/portage/packages/All/$PKGX2.tbz2 ];then
		    mkdir packages/$ARQ
		    mv /usr/portage/packages/All/*.tbz2 packages/$ARQ
		else
		    cp makes.conf/make.conf.$ARQ /etc/make.conf
		    USE="$USEMAKE $USEX" emerge --nodeps $PARM =$PKGX
		    if [ -e /usr/portage/packages/All/$PKGX2.tbz2 ];then
			mkdir packages/$ARQ
			mv /usr/portage/packages/All/*.tbz2 packages/$ARQ
		    else
			echo "Compilation Error in $PKGX"
			#sleep 1000000
		    fi
		fi
	    fi
	fi
    fi
done < compile.list/compile.list
# return to original
cp makes.conf/make.conf.i686 /etc/make.conf

cp uses/package.use.ututo /usr/portage/profiles/base/package.use

ARQ="duron-athlon"
rm -rf /var/tmp/portage/*
cp makes.conf.fast/make.conf.$ARQ /etc/make.conf
while read PKG
do
    SIONO=`echo "$PKG" | grep "\[ebuild   $RECOMPILA"`
    if [ "$SIONO" = "" ];then
	#echo "Processing... $PKG"
	PKGX=`echo $PKG | cut -d "]" -f 2 | cut -d " " -f 2 | cut -d ":" -f 1`
	USEX3=`echo $PKG | cut -d "=" -f 2 | cut -d "\"" -f 2 | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//" | sed "s/(//" | sed "s/)//"`
	USEX2=`echo $USEX3 | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//" | sed "s/*//"`
	USEXX=`echo $USEX2 | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//" | sed "s/%//"`
	USEX=`echo $USEXX | sed "s/ssse3//" | sed "s/sse3//" | sed "s/sse4//" | sed "s/sse2//" | sed "s/sse//" | sed "s/mmx//" |  sed "s/3dnow//" `
	USEMAKE=`cat /etc/make.conf | grep USE | grep -v USE_ | cut -d "\"" -f 2`
	PKGX2=`echo $PKG | cut -d "]" -f 2 | cut -d " " -f 2 | cut -d "/" -f 2 | cut -d ":" -f 1`
	if [ -e packages/$ARQ/$PKGX2.tbz2 ];then
	    echo "Compilado... $PKGX"
	    #sleep 3
	else
	    if [ -e packages/i686/$PKGX2.tbz2 ];then
		clear
		echo "------------------------------------------------------------------"
		echo "Paquete: $PKGX ($PKGX2)"
		echo "USE: $USEMAKE $USEX"
		echo "------------------------------------------------------------------"
		echo " "
		echo " "
		echo " "
		echo " "
		cp makes.conf.fast/make.conf.$ARQ /etc/make.conf
		USE="$USEMAKE $USEX" emerge --nodeps $PARM =$PKGX
		if [ -e /usr/portage/packages/All/$PKGX2.tbz2 ];then
		    mkdir packages/$ARQ
		    mv /usr/portage/packages/All/*.tbz2 packages/$ARQ
		else
		    cp makes.conf/make.conf.$ARQ /etc/make.conf
		    USE="$USEMAKE $USEX" emerge --nodeps $PARM =$PKGX
		    if [ -e /usr/portage/packages/All/$PKGX2.tbz2 ];then
			mkdir packages/$ARQ
			mv /usr/portage/packages/All/*.tbz2 packages/$ARQ
		    else
			echo "Compilation Error in $PKGX"
			#sleep 1000000
		    fi
		fi
	    fi
	fi
    fi
done < compile.list/compile.list
# return to original
cp makes.conf/make.conf.i686 /etc/make.conf
