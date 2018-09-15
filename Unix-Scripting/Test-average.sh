#!/bin/sh

avg=0
temp_total=0
number_of_args=$#

while read do

echo -e "Please enter a few integers separated by a space."

# Check if at least two values were entered

if [ $# -lt 2 ] ; then
   echo -e "ERROR: Please enter at least two values\n"
   exit 1
fi
done

# Calculates the average in two steps

for i in $*
do

   # Step 1: Add all the values entered
   temp_total=`expr $temp_total + $i`

done

# Step 2: calculates the average and returns a message
avg=`expr $temp_total / $number_of_args`

echo "The average of all the numbers you entered is $avg"
