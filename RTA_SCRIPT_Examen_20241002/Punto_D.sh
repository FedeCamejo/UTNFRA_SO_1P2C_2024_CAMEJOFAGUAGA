#! /bin/bash

echo "creo estructura asimétrica"
sudo mkdir -p /Estructura_Asimetrica/{{correo,cliente}/cartas:{1..100},correo/carteros_{1..10}}
 
echo "muestro estructura asimétrica" 
tree /Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4

