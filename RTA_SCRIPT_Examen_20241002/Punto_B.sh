#! /bin/bash 

echo "Creando una partición extendida en el disco /dev/sdc..."

# Crear partición extendida y lógicas usando fdisk
{
    echo "o"    # Crear una nueva tabla de particiones
    echo "n"    # Nueva partición
    echo "p"    # Primaria
    echo "1"    # Número de partición
    echo ""     # Primer sector (por defecto)
    echo "+10G" # Tamaño 10 GB (esto creará la extendida)

    echo "n"    # Nueva partición
    echo "e"    # Extendida
    echo "2"    # Número de partición
    echo ""     # Primer sector (por defecto)
    echo ""     # Usar todo el espacio restante

    # Crear particiones lógicas de 1 GB
    for i in {5..14}
    do
        echo "n"  # Nueva partición
        echo "l"  # Lógica
        echo "$i" # Número de partición
        echo ""   # Primer sector (por defecto)
        if [ "$i" -eq 14 ]; then
            echo "" # Usar el espacio restante en la última partición
        else
            echo "+1G" # Tamaño 1 GB para las demás
        fi
    done

    echo "w"  # Guardar cambios
} | sudo fdisk /dev/sdc

echo "Formateando las particiones lógicas..."
for i in {5..14}
do
    sudo mkfs.ext4 /dev/sdc$i
done

echo "Montando las particiones..."
for i in {5..14}
do
    sudo mount /dev/sdc$i /punto_A/Examenes-UTN/alumno_$(( (i-5)/3 + 2 ))/parcial_$(( (i-5)%3 + 1 ))
done

echo "Proceso completado."
