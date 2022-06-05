#!/bin/bash
read -p "Enter file name:" filename
if [ -e $filename ]
then
if [ $filename != "StudentRecord.txt" ]
then
cp $filename StudentRecord.txt
fi
./duplicate.sh
./duplicate.sh
./duplicate.sh
./3semesters.sh
choices=("Show or print student records (all semesters)."
"Show or print student records for a specific semester."
"Show or print the overall average."
"Show or print the average for every semester."
"Show or print the total number of passed hours."
"Show or print the percentage of total passed hours in relation to total F and FA hours."
"Show or print the total number of hours taken for every semester."
"Show or print the total number of courses taken."
"Show or print the total number of labs taken."
"Insert the new semester record."
"Change in course grade."
"Quit")
select choice in "${choices[@]}"
do case $choice in
"Show or print student records (all semesters).")
echo "$(<$filename)"
;;
"Show or print student records for a specific semester.")
./2.sh
;;
"Show or print the overall average.")
./3.sh
;;
"Show or print the average for every semester.")
./4.sh
;;
"Show or print the total number of passed hours.")
./5.sh
;;
"Show or print the percentage of total passed hours in relation to total F and FA hours.")
./6.sh
;;
"Show or print the total number of hours taken for every semester.")
./7.sh
;;
"Show or print the total number of courses taken.")
./8.sh
;;
"Show or print the total number of labs taken.")
./9.sh
;;
"Insert the new semester record.")
./10.sh
./duplicate.sh
;;
"Change in course grade.")
./11.sh
;;
"Quit")
break
;;
*)
echo "Wrong option!"
;;
esac
done
if [ $filename != "StudentRecord.txt" ]
then
rm StudentRecord.txt
fi
else
echo "File Does not exist"
fi
