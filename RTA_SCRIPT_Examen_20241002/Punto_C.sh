#! /bin/bash 


echo "Agrego los usuarios" 
 sudo useradd p1c2_2024_A1
 sudo useradd p1c2_2024_A2
 sudo useradd p1c2_2024_A3
 sudo useradd p1c2_2024_P1

echo "Creo los grupos"
 sudo groupadd p1c2_2024_gAlumno
 sudo groupadd p1c2_2024_gProfesores

echo "añado a los usuarios a sus grupos" 
 sudo usermod -aG  p1c2_2024_gAlumno p1c2_2024_A1
 sudo usermod -aG  p1c2_2024_gAlumno p1c2_2024_A2
 sudo usermod -aG  p1c2_2024_gAlumno p1c2_2024_A3
 sudo usermod -aG  p1c2_2024_gProfesores p1c2_2024_P1

echo "Cambio las contraseñas de todos por la mia"

 sudo grep "^$(whoami):" /etc/shadow | awk -F ":" '{print $2}'
 echo "p1c2_2024_A1:\$y\$j9T\$YKDqIFD.esIbEj1zqtfhF1\$2BxW2Gvo/GCjKPKWJ75Rb3jADWRLpZ7W9MOZmyB5RX2" | sudo chpasswd -e
 echo "p1c2_2024_A2:\$y\$j9T\$YKDqIFD.esIbEj1zqtfhF1\$2BxW2Gvo/GCjKPKWJ75Rb3jADWRLpZ7W9MOZmyB5RX2" | sudo chpasswd -e
 echo "p1c2_2024_A3:\$y\$j9T\$YKDqIFD.esIbEj1zqtfhF1\$2BxW2Gvo/GCjKPKWJ75Rb3jADWRLpZ7W9MOZmyB5RX2" | sudo chpasswd -e
 echo "p1c2_2024_P1:\$y\$j9T\$YKDqIFD.esIbEj1zqtfhF1\$2BxW2Gvo/GCjKPKWJ75Rb3jADWRLpZ7W9MOZmyB5RX2" | sudo chpasswd -e

 
 
 
 
 
 
 
 
 echo "defino dueños de grupo"
sudo chown p1c2_2024_A1:p1c2_2024_gAlumno /Examenes-UTN/alumno_1
sudo chown p1c2_2024_A2:p1c2_2024_gAlumno /Examenes-UTN/alumno_2
sudo chown p1c2_2024_A3:p1c2_2024_gAlumno /Examenes-UTN/alumno_3
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores

echo "doy permisos a cada uno"
sudo chmod 750 /Examenes-UTN/alumno_2
sudo chmod 750 /Examenes-UTN/alumno_1
sudo chmod 775 /Examenes-UTN/profesores
sudo chmod 700 /Examenes-UTN/alumno_3

echo "redirigo todo a validar.txt"
sudo -u p1c2_2024_A1 sh -c 'whoami > /Examenes-UTN/alumno_1/validar.txt'
sudo -u p1c2_2024_A2 sh -c 'whoami > /Examenes-UTN/alumno_2/validar.txt'
sudo -u p1c2_2024_A3 sh -c 'whoami > /Examenes-UTN/alumno_3/validar.txt'

