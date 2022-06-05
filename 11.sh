#!/bin/bash
echo "Enter Course Symbol"
read course
coursefound=$(grep "$course [1-9][0-9]" StudentRecord.txt -o)
if [ ! -z "$coursefound" ]
then
echo "New Grade:"
read newgrade
newcourse=$(echo $coursefound | cut -d' ' -f1)
newcourse+=" $newgrade"
echo "Old Course Grade: $coursefound"
echo "New Course Grade: $newcourse"
echo "Confirm changes by typing Yes, or not by typing anything else"
read confirm
if [ $confirm = "Yes" ]
then
sed -i "s/$coursefound/$newcourse/" StudentRecord.txt
echo "Grade Changed!"
else
echo "No changes were made"
fi
fi
