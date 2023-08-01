#!/bin/bash

output=$(who)

while IFS=read -r line
do
  username=$(echo "$line" | cut -d ' ' -f1)
  roll=$(echo "$line" | cut -d ' ' -f2)
  mess=$(echo "$line" | cut -d ' ' -f5)
  echo "$roll $mess" > /home/HAD/mess.txt
done < studentDetails.txt


if ["$who" == HAD]
then
     while IFS=read -r line
     studentpref=$(echo "$line" | cut -d ' ' -f1)
     messpref=$(echo "$line" | cut -d ' ' -f2)
     i=0 j=0 k=0
     if (messpref==1 && i<=35)
     then
         echo "$studentpref mess is $messpref" >> /home/HAD/mess.txt
         i++

     elif (messpref==3 && j<=35)
     then
         echo "$studentpref mess is $messpref" >> /home/HAD/mess.txt
         j++

     elif (messpref==3 k<=35)
     then
         echo "$studentpref mess is $messpref" >> /home/HAD/mess.txt
         k++
