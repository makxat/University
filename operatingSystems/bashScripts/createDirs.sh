#!/bin/bash

#Z1
echo $(mkdir /home/student/ka_1)
echo $1

#Z2
cd ka_1

#Z3
mkdir d1 d2 d3 Aa Bb Cc
cd d1
mkdir d1.1
touch t1.txt
cd ..
cd d2
mkdir d2.1
cd d2.1
touch f1.csv
cd ../..
cd d3
mkdir d3.1 d3.2
cd d3.2
touch f2.csv
cd ../..

#Z4
mv d1/t1.txt d1/d1.1

#Z5
cp /home/student/ka_1/d2/d2.1/f1.csv /home/student/ka_1/d1

#Z6
mv Aa/ Aa1/

#Z7

#Z8
du /home/student/ka_1 -ah







