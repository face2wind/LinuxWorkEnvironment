# can not use this "#!/bin/sh" or history don't work

show_row=20

if [ $# = 1 ] ; then
    show_row=$1
fi

history | awk '{CMD[$5]++;count++} END { for(a in CMD)print CMD[a]" "CMD[a]/count*100 "% " a }' | grep -v "./" | column -c3 -s " " -t | sort -nr |nl | head -n $show_row
