set xdata time
set timefmt "%H_%M_%S"
set term jpeg;
set output 'xxx.jpg'
plot "xxx.data" using 1:2 with linespoints
