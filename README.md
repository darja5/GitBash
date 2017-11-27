TAREA DE LA SHELL DE UNIX y GIT

The idea of the project is to write a script in Bash shell that will access
monthly data on production of electrica given on:
http://www.minetur.gob.es/energia/balances/Publicaciones/ElectricasMensuales/Paginas/ElectricasMensuales.aspx
The data that we are interested in is the data obtained in the file 
1.2.7 PRODUCCION BRUTA DE ENERGIA TERMOELECTRICA POR PROVINCIAS SEGUN EL COMBUSTIBLE.

We want to create directory for every Comunidad autonoma in Spain as ID_Nombre Comunidad Autónoma and
inside each one of these create a directory for provincia as ID_Nombre Provincia.
We can find relations between Comunidades autonomas and provincias here:
http://www.ine.es/daco/daco42/codmun/cod_ccaa_provincia.htm
Inside each of the directory of provincia we will create a file for each type of termoelectrical energy
including file named total.
Each of the mentioned files should include the date and the amount of termoelectrical energy in the following format
200601 60221
200602 62933
........

Where the date is wrriten as year and month (AAAAMM) and the amount of energy produced in written in MWh without dots('.').

The usage of GitHub during the development of the project was neccessary.
Because the project is divided into 3 main parts we created 3 script corresponding to each part. 

There are no speacial requirements for running the scripts. Though you should first
check if your working directory is ok. 
Running the last script should take a little bit longer then running the first two.

