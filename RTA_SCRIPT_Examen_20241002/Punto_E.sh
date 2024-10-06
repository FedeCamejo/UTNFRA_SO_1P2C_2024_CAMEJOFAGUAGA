#! /bin/bash

echo "Busco la infomracion de memoria ram y la asigno a filtro basico bajo MemTotal"
 sudo cat /proc/meminfo | grep "MemTotal" > Filtro_Basico.txt

 echo "Busco la informacion de chasis y la asigno a filtro basico bajo MemTotal"

sudo dmidecode -t chassis | grep "Manufacturer" >> Filtro_Basico.txt


echo "Muestro la informacion"

cat Filtro_Basico.txt

