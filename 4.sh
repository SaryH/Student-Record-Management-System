numberofcourses=$(grep . StudentRecord.txt | tr -cd , | wc -c)
lines=$(wc -l StudentRecord.txt | cut -d" " -f1)
i=1
while read line; do
coursesnum=$(head -n1 StudentRecord.txt | awk -F "," ' { print NF } ')
for j in `seq 1 $coursesnum`
do
echo "$line" | cut -d';' -f2 | grep . | cut -d',' -f$j | cut -c7,11,12 >> temp.txt
done
count=0;
total=0;
#add hours
while read x; do
hour=$(echo $x | cut -c1)
count=$((count+hour))
done <temp.txt
#add points
while read x; do
hour=$(echo $x | cut -c1)
grade=$(echo $x | cut -c2,3)
if [ ! -z "$grade" ]
then
if [ $grade = "F" ]
then
total=$((total+55))
elif [ $grade = "FA" ]
then
total=$((total+50))
elif [ $grade = "I" ]
then
count=$((count-hour))
else
total=$((total+grade*hour))
fi
fi
done <temp.txt
average=$((total/count))
echo "Average of Semester $i: $average"
i=$((i+1))
rm temp.txt
done <StudentRecord.txt
