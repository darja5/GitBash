#!/bin/bash 
#The second script gets a html file with relations between spanish comunidades autónomas and their provincias.
#Based on the information gained it creates a tree with directories called ID_Comunidad_Autónoma where each
#of them contains one or more directories of the provincias called ID_Provincia. Before creating the directores
#we extract the lines with the names of the cuidades autonomas and provincias and take care of some special cases
#that occured while reading accents á, é, í, ó, ú, ñ where for example a letter í was written as "s/&iacute;".
#When changing the names we try to make them as the names of provincias that occur in .txt files we are going to use later on.

curl http://www.ine.es/daco/daco42/codmun/cod_ccaa_provincia.htm > file.html
cat file.html | grep  -o '<td>.*</td>' | sed '/^\s*$/d' | sed 's/&ntilde;/ñ/g' | sed 's/&iacute;/i/g' | sed 's/&oacute;/o/g' | sed 's/&aacute;/a/g'| sed 's/&Aacute;/A/g' | sed 's/&eacute;/e/g' | sed 's/&egrave;/e/g' | cut -d '>' -f 2 | cut -d '<' -f 1 | sed '/^$/d' | cut -d '/' -f 1 > file.txt

#change of the names of the provincias and comunidades autonomas			
cat file.txt | sed 's/ /_/g' | tr -d [","] | sed 's/Bizkaia/VIZCAYA/g'| sed 's/Santa_Cruz_de_Tenerife/S.C.TENERIFE/g' | sed 's/Araba/ALAVA/g' | sed 's/Ourense/Orense/g' | sed 's/Gipuzkoa/Guipuzcoa/g' | sed 's/ñ/Ñ/g' | sed 's/Rioja_La/la_rioja/g'| sed 's/Palmas_Las/las_palmas/g' | tr '[:lower:]' '[:upper:]' | sed 's/BALEARS_ILLES/BALEARES/g' | sed 's/CORUÑA_A/LA_CORUÑA/g' | sed 's/Ñ/N/g' > file1.txt

mkdir spain
#we read 4 lines at once since the first line represents the ID of comunidad autonoma, the second the name of the comunidad autonoma
#the third the ID of provincia and the tourth the name of the provincia
cat file1.txt | while read -r line
do
	idcom="$line"; read -r line; comunidad="$line"; read -r line; idpro="$line"; read -r line; provincia="$line"
	dircom="$idcom"_"$comunidad"; dirpro="$idpro"_"$provincia"
	#because more provincias have the same comunidad autonoma, we have to check if directory of it's comunidad autonoma already exists
	if [ ! -d "spain/"$dircom"" ]; then
		mkdir "spain/"$dircom""
	fi
	mkdir "spain/"$dircom"/"$dirpro""
done 