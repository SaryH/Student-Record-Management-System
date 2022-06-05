numberofcourses=$(grep . StudentRecord.txt | tr -cd , | wc -c)
lines=$(wc -l StudentRecord.txt | cut -d" " -f1)
#numberofcourses=$((numberofcourses/$lines+1))
for i in `seq 1 $numberofcourses`
do
cut -d';' -f2 StudentRecord.txt | grep . | cut -d',' -f$i | cut -c7,11,12 >> temp.txt
done
courses=0
#add points
while read x; do
if [ ! -z "$x" ]
then
courses=$((courses+1))
fi
done <temp.txt
echo "Total Courses Taken: $courses"
rm temp.txt
