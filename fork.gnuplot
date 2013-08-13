set title 'Benchmark of fork for parent/child'
set xlabel 'number of fork already done'
set ylabel 'time [us]'
set key right bottom
plot 'parent.csv' using 1:2 title 'parent',\
  'child.csv' using 1:2 title 'child'
