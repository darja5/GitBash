#!/bin/bash
#The main idea of the last script is to read the .txt files for each month of the year and create other .txt file named
#after the column in the same .txt file. Lines of this file contain data about Provinicias and its production of fuel, carbones,..
#Knowing this data and having a structure of the relation tree between ciudades autonomas and provincias the script writes 
#data of the year and month and the emount of particular production in a file named after it and puts it in the apropriate directory.
#So at the end each directory of provinacias in Spain will contain 7 .txt files named compustibleNuclear, carbones,.. 
#whose contents will look like this: 
#200601 704350
#200602 645577
#200603 566475
#200604 533406
#200605 615843
#200606 568253
#200607 778101
#.............

for year in {2006..2014}
do
	for month in 01 02 03 04 05 06 07 08 09 10 11 12
	do 
		cat $(find ${year}/${month}/ -name '*.txt') | tail -54 | head -52 > f.txt
		cat f.txt | while read -r line
		do
			for i in compustibleNuclear,2 carbones,3 lignitos,4 fuel,5 gasNatural,6 otrosCompustibles,7 total,8
			do
				IFS=","; set -- $i  # $1 == compustiblesNuclear, $2 == 2
				#take care of some special characters
				proName=$(echo "$line" | awk -F'  '+ '{print $1}' | sed 's/ /_/g'| sed 's/Ñ/N/g')
				#each line is separated with delimeter '  ' where we are interested in the column dependent of variable i in for loop. Adding a time stamp and deleting dots in amounts 
				echo "$line" | awk -v col=${2} -F'  '+ '{print $col}' | awk -F' ' '{print $1}' | awk -v yearMonth="${year}${month}" -F. '{print yearMonth,$1$2$3}' >> $(find spain/*/* -name "*"$proName"")/${1}.txt
			done
		done 		
	done
done

		