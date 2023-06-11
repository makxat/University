#!/bin/bash

#Z1
mkdir $2

#Z2
echo =====================================
find $1 -type f -name "*.txt"

#Z3
echo =====================================
find $1 -type d -name "[AabB]*"

#Z4
echo =====================================
find $1 -type f -name "*.sh" -perm /a=x

#Z5
echo =====================================
find $1 -type f -user student -empty

#Z6
echo =====================================
find $1 -type l

#Z7
echo =====================================
find $1 -type f -group student -size -1M

#Z8
echo =====================================
find $1 -type f -perm /a=x \( -perm /u=s -o -perm /g=s \)

#Z9
echo =====================================
find $1 -type f -perm /a=t

#Z10
echo =====================================
find $1 -type f -mmin -60

#Z11
echo =====================================
find /dev -type c -o -type b

#Z12
echo =====================================
find $1 -type d -empty -exec rmdir {} \;

#Z13
echo =====================================
find $1 -type f -size +10M -exec mv -t $2 {} \;

#Z14
echo =====================================
find $1 -type d -name "Z*" -exec cp -R {} "$2" \;
