numberofcourses=$(grep . StudentRecord.txt | tr -cd , | wc -c)
lines=$(wc -l StudentRecord.txt | cut -d" " -f1)
#numberofcourses=$((numberofcourses/$lines+1))
for i in `seq 1 $numberofcourses`
do
cut -d';' -f2 StudentRecord.txt | grep . | cut -d',' -f$i | cut -c7,11,12 >> temp.txt
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
echo "Cumulative Average is: $average"
rm temp.txt
