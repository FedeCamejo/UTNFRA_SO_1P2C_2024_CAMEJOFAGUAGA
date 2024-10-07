#!/bin/bash

echo "Particiono el disco: /dev/sdc."
echo

sudo fdisk /dev/sdc << EOF
n
e
4


n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n


w
EOF

echo
echo "Particiones creadas."
sudo fdisk -l /dev/sdc
echo
echo "Formateo las particiones: "

for i in {5..14}; do
    sudo mkfs.ext4 /dev/sdc$i
done

echo

# Definir el rango de particiones y el número de alumnos y parciales
particiones=(5 6 7 8 9 10 11 12 13 14)  # Lista de particiones disponibles
alumnos=3
parciales=3

echo "Monto las particiones: "
index=0  # Índice para acceder a la lista de particiones

for j in $(seq 1 $alumnos); do
    for x in $(seq 1 $parciales); do
        if [ $index -lt ${#particiones[@]} ]; then
            # Asignar la partición
            particion=${particiones[$index]}
            dir_path=~/Examenes-UTN/alumno_$j/parcial_$x

            # Crea el directorio si no existe
            mkdir -p "$dir_path"

            # Agrega la entrada a fstab
            echo "/dev/sdc$particion $dir_path ext4 defaults 0 0" | sudo tee -a /etc/fstab

            # Monta la partición
            sudo mount /dev/sdc$particion "$dir_path"
            ((index++))  # Incrementa el índice para la siguiente partición
        else
            echo "No hay suficientes particiones disponibles."
            exit 1
        fi
    done
done

# Montar la última partición en el directorio del docente
if [ $index -lt ${#particiones[@]} ]; then
    particion=${particiones[$index]}
    dir_profesores=~/Examenes-UTN/profesores

    # Crea el directorio del docente si no existe
    mkdir -p "$dir_profesores"

    # Agrega la entrada a fstab
    echo "/dev/sdc$particion $dir_profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab

    # Monta la partición
    sudo mount /dev/sdc$particion "$dir_profesores"
    echo "La última partición se ha montado en el directorio docente."
else
    echo "No hay suficientes particiones disponibles para el docente."
    exit 1
fi

