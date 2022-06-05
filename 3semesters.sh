#!/bin/bash
grep "[2-9][0-9][0-9][0-9]-[2-9][0-9][0-9][0-9]/" StudentRecord.txt -o | uniq -c | tr -s ' ' ' ' > temp.txt
while read line
do
numberoftimes=$(echo $line | cut -d' ' -f1)
if [ $numberoftimes -gt 3 ]
then
semester=$(echo $line | cut -d' ' -f2)
last=$(grep $semester[1-9] StudentRecord.txt -o | tail -n1)
cp StudentRecord.txt StudentRecord1.txt
grep -v $last StudentRecord1.txt > StudentRecord.txt
rm StudentRecord1.txt
fi
done <temp.txt
rm temp.txt
