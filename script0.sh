months=('Enero' 'Febrero' 'Marzo' 'Abril' 'Mayo' 'Junio' 'Julio' 'Agosto' 'Septiembre' 'Octubre' 'Noviembre' 'Diciembre')
for year in {2006..2014}
do
	mkdir ${year}
	cd ${year}
	for month in "${months[@]}"
	do
		mkdir ${month}
		cd ${month}
		curl www.minetad.gob.es/energia/balances/Publicaciones/ElectricasMensuales/${year}/${month}{%20,_}${year}.zip > ${year}${month}.zip
		unzip -j ${year}${month}.zip '**127P*'
		rm ${year}${month}.zip
		cd ..
	done
	cd ..
done
