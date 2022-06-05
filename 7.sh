numberofcourses=$(grep . StudentRecord.txt | tr -cd , | wc -c)
lines=$(wc -l StudentRecord.txt | cut -d" " -f1)
numberofcourses=$((numberofcourses/$lines+1))
i=1
while read line; do
coursesnum=$(head -n1 StudentRecord.txt | awk -F "," ' { print NF } ')
for j in `seq 1 $coursesnum`
do
echo "$line" | cut -d';' -f2 | grep . | cut -d',' -f$j | cut -c7,11,12 >> temp.txt
done
total=0;
#add hours
while read x; do
hour=$(echo $x | cut -c1)
if [ ! -z "$hour" ]
then
total=$((total+hour))
fi
done <temp.txt
echo "Total Hours in Semester $i: $total"
i=$((i+1))
rm temp.txt
done <StudentRecord.txt
