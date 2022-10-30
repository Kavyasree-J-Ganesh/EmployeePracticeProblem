#!/bin/bash -x

isPartTime=1;
isFullTime=2;
maxHrsInMonth=10;
empRatePerHr=20;
numWorkingDays=20;

totalEmpHr=0;
totalWorkingDays=0;

function getWorkingHrs() {
       case $1 in
                $isPartTime)
                        workHours=4
                        ;;

                $isFullTime)
                        workHours=8
                        ;;

                *)
                        workHours=0
                        ;;
        esac
        echo $workHours
}

while [[ $totalEmpHr -lt $maxHrsInMonth  && $totalWorkingDays -lt $numWorkingDays ]]
do
        ((totalWorkingDays++))
	workHours="$( getWorkingHrs $((RANDOM%3)) )"
        totalEmpHr=$(($totalEmpHr+$workHours))
done

salary=$(($totalEmpHr*$empRatePerHr))

