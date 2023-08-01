#!/bin/bash

#creating the account for Hostel Admin
sudo useradd HAD
echo"Enter the password for Hostel Admin"
sudo passwd HAD


#making home directory for Hostel Admin
sudo mkhomedir_helper HAD
sudo chmod 777 /home/HAD
sudo touch /home/HAD mess.txt


#creating account for Hostel Wardens
sudo useradd GarnetA
echo"Enter the password for GarnetA"
sudo passwd GarnetA

sudo useradd GarnetB
echo"Enter the password for GarnetB"
sudo passwd GarnetB

sudo useradd Agate
echo"Enter the password for Agate"
sudo passwd Agate

sudo useradd Opal
echo"Enter the password for Opal"
sudo passwd Opal

#making home directory for Hostel Wardens
sudo mkhomedir_helper GarnetA
sudo mkhomedir_helper GarnetB
sudo mkhomedir_helper Agate
sudo mkhomedir_helper Opal

for ((i=0; i<=11; i++))
do
  room_number=$(printf $i)
  sudo mkdir ~/Agate/$room_number
  sudo mkdir ~/GarnetA/$room_number
  sudo mkdir ~/Opal/$room_number
  sudo mkdir ~/GarnetB/$room_number
done

sudo touch ~/Agate/announcements.txt feeDefaulters.txt
sudo touch ~/GarnetA/announcements.txt feeDefaulters.txt
sudo touch ~/GarnetB/announcements.txt feeDefaulters.txt
sudo touch ~/Opal/announcements.txt feeDefaulters.txt

#to check whether file is passed or details need to be manually given
file=studentDetails.txt
sudo touch /home/userDetails.txt fees.txt
sudo cp -a /home/userDetails.txt fees.txt /etc/skel

if  [ -f "$file"];  #studentDetails.txt is present
then
    while IFS= read -r line
    do
       username=$(echo "$line" | cut -d ' ' -f1)
       sudo useradd "$username"
       sudo mkhomedir_helper "$username"
       sudo chmod 777 /home/"$username"/userDetails.txt
       sudo echo "$line"

       hostel=$(echo "$line" | cut -d ' ' -f3)
       room=$(echo "$line" | cut -d ' ' -f4)
       if [ "$hostel" == GarnetB]
       then
           sudo cp /home/"$username" ~/GarnetB/"$room"

       if [ "$hostel" == GarnetA]
       then
           sudo cp /home/"$username" ~/GarnetA/"$room"

       if [ "$hostel" == Agate]
       then
           sudo cp /home/"$username" ~/GarnetB/"$room"

       if [ "$hostel" == Opal]
       then
           sudo cp /home/"$username" ~/GarnetB/"$room"
       fi

    done < "$file"

else #studentDetails.txt is not present
   echo "Enter number of students"
   read s
   for ((i=1;i<=s;i++));
   do
     echo "Enter Student's Name"
     read user_name
     sudo useradd "$user_name"
     sudo mkhomedir_helper "$user_name"
     sudo chmod 777 /home/"$username"/userDetails.txt
     echo "Name | Roll Number | Department |Year | Hostel"
     read name roll_number department year hostel
     sudo echo "$name,$roll_number,$department,$hostel" > /home/"$username"/userDetails.txt
   done
fi
