#!/bin/bash
#Z1
mkdir -v $1
cd $1

#2
mkdir -v D1 D2 D3 D4
touch D2/F1.txt D3/F1.txt D4/F1.txt

#3
cd D1
ln -s /etc/passwd

#4
readlink passwd

#5
cd ..
cd D2
ln ~/264153_lab2/$1/D3/F1.txt F2.txt

#6
chmod 600 F2.txt

#7
sudo chown :daemon F2.txt
ls -ls F2.txt

#8
sudo chgrp daemon ~/264153_lab2/$1/D3 
 
 #9
 chmod 666 ~/264153_lab2/$1/D3  
 
 #10
 chmod 555 ~/264153_lab2/$1/D2  
  
 #11
 chmod 333 ~/264153_lab2/$1/D4
 
 #12
 chmod +t ~/264153_lab2/$1/D4
 
 #13
 touch ~/264153_lab2/$1/D1/scr1.sh
 chmod 110 ~/264153_lab2/$1/D1/scr1.sh
 
 #14
 chmod 2555 ~/264153_lab2/$1/D1/scr1.sh
 chmod 4555 ~/264153_lab2/$1/D1/scr1.sh
 
