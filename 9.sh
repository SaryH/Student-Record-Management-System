numberofcourses=$(grep . StudentRecord.txt | tr -cd , | wc -c)
lines=$(wc -l StudentRecord.txt | cut -d" " -f1)
#numberofcourses=$((numberofcourses/$lines+1))
for i in `seq 1 $numberofcourses`
do
cut -d';' -f2 StudentRecord.txt | grep . | cut -d',' -f$i | cut -c7,11,12 >> temp.txt
done
labs=0
#add points
while read x; do
hour=$(echo $x | cut -c1)
grade=$(echo $x | cut -c2,3)
if [ ! -z "$grade" ]
then
if [ $hour -eq 1 ]
then
labs=$((labs+1))
fi
fi
done <temp.txt
echo "Total Labs Taken: $labs"
rm temp.txt
