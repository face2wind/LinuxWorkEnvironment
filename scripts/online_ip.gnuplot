set xdata time
set timefmt "%H_%M_%S"
set term jpeg;
set output 'xxx.jpg'
set format x "%H:%M"
plot "xxx.data" using 1:2 with linespoints
