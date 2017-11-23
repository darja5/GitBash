#!/bin/bash

for year in 2006
do
	for month in 01 # 02 03 04 05 06 07 08 09 10 11 12
	do 
		cat $(find ${year}/${month}/ -name '*.txt') | tail -54 | head -52 > f.txt
		
		cat f.txt | while read -r line
		do
			yearMonth="${year}${month}"
			proName=$(echo "$line" | awk -F'  '+ '{print $1}' | sed 's/ /_/g')
			val=$(echo "$line" | awk -F'  '+ '{print $2}' | awk -F. '{print $1$2$3}') 
			file=$(find spain -name "*/*${proName}")
			#echo "$file"
			p="${yearMonth} ${val}"
			echo "$p" >>  "${file}/compustibleNuclear.txt"
		done 		
	done
done

		