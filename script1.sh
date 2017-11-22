#!/bin/bash 

curl http://www.ine.es/daco/daco42/codmun/cod_ccaa_provincia.htm > file.html
cat file.html | grep  -o '<td>.*</td>' | sed '/^\s*$/d' | sed 's/&ntilde;/ñ/g' | sed 's/&iacute;/i/g' | sed 's/&oacute;/o/g' | sed 's/&aacute;/a/g'| sed 's/&Aacute;/A/g' | sed 's/&eacute;/e/g' | sed 's/&egrave;/e/g' | cut -d '>' -f 2 | cut -d '<' -f 1 | sed '/^$/d' | cut -d '/' -f 1 > file.txt

#change of the names of the provincias and comunidades autonomas SANTA_CRUZ_DE_TENERIFE 			
cat file.txt | sed 's/ /_/g' | tr -d [","] | sed 's/Bizkaia/VIZCAYA/g'| sed 's/Santa_Cruz_De_Tenerife/S.C.TENERIFE/g' | sed 's/Araba/ALAVA/g' | sed 's/Ourense/ORENSE/g' | sed 's/Gipuzkoa/Guipuzcoa/g' | sed 's/ñ/Ñ/g' | sed 's/rioja/la_rioja/g'| sed 's/palmas/las_palmas/g' | tr '[:lower:]' '[:upper:]' | sed 's/BALEARS_ILLES/BALEARES/g' > file1.txt

mkdir spain
cat file1.txt | while read -r line
do
	idcom="$line"
	read -r line
	comunidad="$line"
	read -r line
	idpro="$line"
	read -r line
	provincia="$line"
	dircom="$idcom"_"$comunidad"
	dirpro="$idpro"_"$provincia"
	
	if [ ! -d "spain/"$dircom"" ]; then
		mkdir "spain/"$dircom""
	fi
	mkdir "spain/"$dircom"/"$dirpro""
done 