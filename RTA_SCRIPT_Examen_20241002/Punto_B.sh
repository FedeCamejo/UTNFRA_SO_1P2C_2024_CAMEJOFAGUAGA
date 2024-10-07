#! /bin/bash 

echo "Creando una partición extendida en el disco /dev/sdc..."

# Crear partición extendida y lógicas usando fdisk
sudo fdisk /dev/sdc/

{
  echo  "p" # Ver la tabla de particiones
   echo  "n" # Crear una nueva partición
    echo "e" # Partición extendida
    echo "" # Aceptar el sector de inicio por defecto
    echo "+10G" # Tamaño de la partición extendida, le entrego todo el disco

    # Crear particiones lógicas de 1 GB
    for i in {1..10}
    do
        echo "n"  # Nueva partición
        echo "l"  # Lógica
        echo "$i" # Número de partición
        echo ""   # Primer sector (por defecto)
        if [ "$i" -eq 10 ]; then
            echo "" # Usar el espacio restante en la última partición
        else
            echo "+1G" # Tamaño 1 GB para las demás
        fi
    done

    echo "w"  # Guardar cambios
} | sudo fdisk /dev/sdc

echo "Formateando las particiones lógicas..."
for i in {1..10}
do
    sudo mkfs.ext4 /dev/sdc$i
done

echo "Montando las particiones..."
for i in {1..10}
do
    sudo mount /dev/sdc$i /punto_A/Examenes-UTN/alumno_$(( (i-5)/3 + 2 ))/parcial_$(( (i-5)%3 + 1 ))
done

echo "Proceso completado."
