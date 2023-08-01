#!/bin/bash

#to pay the fee and append  the details
echo "Enter the amount paid"
read amount
tf=0 hr=0 schr=0 mfe=0

TuitionFee=$(( $amount / 2 ))
HostelRent=$(( $amount / 5))
ServiceCharge=$(( $amount / 10))
MessFee=$(( $amount / 5 ))

echo $(( $tf + $TuitionFee)) >> realpath "$USER"/fee.txt
echo $(( $hr + $HostelRent)) >> realpath "$USER"/fee.txt
echo $(( $schr + $ServiceCharge)) >> realpath "$USER"/fee.txt
echo $(( $mfe + $MessFee)) >> realpath "$USER"/fee.txt


tf=$TuitionFee
hr=$HostelRent
schr=$ServiceCharge
mfe=$MessFee

unset amount
unset TuitionFee
unset HostelRent
unset ServiceCharge
unset MessFee

