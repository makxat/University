#!/bin/bash

#Z1
mkdir $1

#Z2
echo ======================
echo Z2
cat /etc/passwd | grep $(whoami)

#Z3
cat /etc/passwd | cut -d':' -f1,6,7 | sort -r > $1/F1.csv

#Z4
cat /etc/passwd | cut -d':' -f7 | rev | sort | rev | uniq > $1/F2.csv

#Z5
cat /etc/passwd | cut -d':' -f1 | tr a-z A-Z > $1/F3.csv

#Z6
echo =====================
echo Z6
nl /etc/passwd | grep "pulse"
cat /etc/passwd | head -n 46 | tail -9 > $1/F4.txt

#Z7
diff -y /etc/passwd $1/F4.txt > $1/differences.txt
