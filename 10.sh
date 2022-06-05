#!/bin/bash
echo "Enter Semester:"
read semester
result=""
result+="$semester; "
courses=0
while true
do
echo "Enter course symbol: (or done if you are done)"
read course
if [ $course = "done" ]
then
break
fi
if [[ $course = ENEE[2-5][1-9][0-9][0-9]* ]]
then
echo "Enter Course grade:"
read grade
if [[ $grade -ge 60 && $grade -le 99 || $grade = "F" || $grade = "FA" || $grade = "I" ]]
then
result+=" $course"
result+=" $grade,"
courses+=1
else
echo invalid grade
continue
fi
elif [[ $course = ENCS[2-5][1-9][0-9][0-9]* ]]
then
echo "Enter Course grade:"
read grade
if [[ $grade -ge 60 && $grade -le 99 || $grade = "F" || $grade = "FA" || $grade = "I" ]]
then
result+=" $course"
result+=" $grade,"
courses+=1
else
echo invalid grade
continue
fi
else
echo invalid course
fi
done
echo $result>temp1.txt
#checking total hours
for i in `seq 1 $courses`
do
cut -d';' -f2 temp1.txt | grep . | cut -d',' -f$i | cut -c7,11,12 >> temp2.txt
done
echo $result
hours=0
while read x; do
hour=$(echo $x | cut -c1)
if [ ! -z "$hour" ]
then
hours=$((hour+hours))
fi
done <temp2.txt
rm temp1.txt
rm temp2.txt
if [ $hours -ge 12 ]
then
echo "$result" >> StudentRecord.txt
echo "Semester Added to Student Record:"
echo $result
else
echo "Invalid Record, credit hours must be greater than 12!"
fi
