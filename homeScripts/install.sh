#!/bin/sh

echo "============= install home scripts start ! ================"

path=`pwd -P`/$0
#echo "path = $path"
bashrcPath=`echo $path |  sed -e 's/install.sh/.bashrc/'`
profilePath=`echo $path |  sed -e 's/install.sh/.profile/'`

cd ~

if [ -f ".profile" -o -L ".profile" ] ; then
    echo "backup old .profile"
    mv .profile .profile.bak
fi
if [ -f ".bashrc" -o -L ".bashrc" ] ; then
    echo "backup old .bashrc"
    mv .bashrc .bashrc.bak
fi

echo "ln -s $bashrcPath ."
ln -s $bashrcPath .

echo "ln -s $profilePath ."
ln -s $profilePath .

echo "============= install home scripts complete ! ============="
echo ""
