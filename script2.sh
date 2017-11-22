#!/bin/bash
for year in 2006
do
	for month in 01 # 02 03 04 05 06 07 08 09 10 11 12
	do 
		
		cat $(find ${year}/${month}/ -name '*.txt') | tail -54 | head -52 > f.txt
		
		cat f.txt | while read -r line
		do
			cat "$line" | awk -F'  '+ '{print $2}' # | awk -F. '{print $$1$2$3}' "$line" >> compustibleNuclear.txt
		done 
				
	done
done