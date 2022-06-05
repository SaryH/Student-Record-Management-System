#!/bin/bash
grep "[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]" StudentRecord.txt -o | sort | uniq -c | tr -s ' ' ' ' > temp.txt
while read line
do
numberoftimes=$(echo $line | cut -d' ' -f1)
if [ $numberoftimes -gt 1 ]
then
course=$(echo $line | cut -d' ' -f2)
first=$(grep -e "$course [A1-Z9][A0-Z9]" -e "$course [A1-Z9]"  StudentRecord.txt -o | head -n1)
newcourse=""
newcourse+="$course"
newcourse+=" I"
sed -i "s/$first/$newcourse/" StudentRecord.txt
fi
done <temp.txt
rm temp.txt
