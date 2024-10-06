#! /bin/bash

echo "Creo el archivo filtro avanzado y direcciono todo con EOF para poder crearlo mas rapido"

cat << EOF > Filtro_Avanzado.txt
Mi IP pública es: $(curl -s ifconfig.me)
Mi usuario es: $(whoami)
El hash de mi usuario es: $(sudo grep "^$(whoami):" /etc/shadow | awk -F ":" '{print $2}')
EOF

echo "Muestro el archivo"

cat Filtro_Avanzado.txt 
