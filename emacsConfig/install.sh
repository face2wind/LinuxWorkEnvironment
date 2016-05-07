#!/bin/sh

echo "============= install emacs config start ! ================="

path=`pwd -P`/$0
configPath=`echo $path |  sed -e 's/install.sh/.emacs/'`
lispPath=`echo $path |  sed -e 's/install.sh/personalLisp/'`

cd ~

if [ -f ".emacs" -o -L ".emacs" ] ; then
    if [ -f ".emacs.bak" -o -L ".emacs.bak" ] ; then
	echo "remove old .emacs"
	rm -rf .emacs
    else
	echo "backup old .emacs"
	mv .emacs .emacs.bak
    fi
fi

if [ ! -d ".emacs.d" ] ; then
    echo "create .emacs.d"
    mkdir .emacs.d
fi

if [ -f ".emacs.d/personalLisp" -o -L ".emacs.d/personalLisp" ] ; then
    echo "remove old personalLisp"
    rm -rf .emacs.d/personalLisp
    #mv .emacs.d/personalLisp .emacs.d/personalLisp.bak
fi

echo "ln -s $configPath ."
ln -s $configPath .

echo "ln -s $lispPath .emacs.d/"
ln -s $lispPath .emacs.d/

echo "============= install emacs config complete ! ============="
echo ""
