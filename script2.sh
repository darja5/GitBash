#!/bin/bash
months=('Enero',01 'Febrero',02 'Marzo',03 'Abril',04 'Mayo',05 'Junio',06 'Julio',07 'Agosto',08 'Septiembre',09 'Octubre',10 'Noviembre',11 'Diciembre',12)
for year in 2006
do
	for month in "${months[@]}"
	do 
		IFS=","; set -- $month  # $1 == enero, $2 == 01
		f=$(find ${year}/${1} -name '*.txt')
		echo "$f"
	done
done