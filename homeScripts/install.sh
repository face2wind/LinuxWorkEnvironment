#!/bin/sh

echo "============= install home scripts start ! ================"

path=`pwd -P`/$0
#echo "path = $path"
bashrcPath=`echo $path |  sed -e 's/install.sh/.bashrc/'`
profilePath=`echo $path |  sed -e 's/install.sh/.profile/'`

cd ~

if [ -f ".profile" -o -L ".profile" ] ; then
    if [ -f ".profile.bak" -o -L ".profile.bak" ] ; then
	echo "remove old .profile"
	rm -rf .profile
    else
	echo "backup old .profile"
	mv .profile .profile.bak
    fi
fi
if [ -f ".bashrc" -o -L ".bashrc" ] ; then
    if [ -f ".bashrc.bak" -o -L ".bashrc.bak" ] ; then
	echo "remove old .bashrc"
	rm -rf .bashrc
    else
	echo "backup old .bashrc"
	mv .bashrc .bashrc.bak
    fi
fi

echo "ln -s $bashrcPath ."
ln -s $bashrcPath .

echo "ln -s $profilePath ."
ln -s $profilePath .

echo "============= install home scripts complete ! ============="
echo ""
