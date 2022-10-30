#!/bin/bash -x

isPartTime=1;
isFullTime=2;
maxHrsInMonth=10;
empRatePerHr=20;
numWorkingDays=20;

totalEmpHr=0;
totalWorkingDays=0;

while [[ $totalEmpHr -lt $maxHrsInMonth  && $totalWorkingDays -lt $numWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))

	case $empCheck in
		$isPartTime)
			empHrs=4
			;;

		$isFullTime)
			empHrs=8
			;;

		*)
			empHrs=0
			;;
	esac
	totalEmpHr=$(($totalEmpHr+$empHrs))
done

salary=$(($totalEmpHr*$empRatePerHr))
