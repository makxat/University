#!/bin/bash

#Z1
echo ===============
echo Z1
file $1

#Z2
echo ===============
echo Z2
wc -l $1

#Z3
echo ===============
echo Z3
wc -m $1

#Z4
echo ===============
echo Z4
du  -h $1

#Z5
echo ===============
echo Z5
cat plik_tekstowy.txt | grep "$2" $1 
grep "$2" $1 | wc -l

#Z6
echo ===============
echo Z6
grep -v "$2" $1 | wc -l

#Z7
echo ===============
echo Z7
cat $1 | head -n 5 | tail -n 1

