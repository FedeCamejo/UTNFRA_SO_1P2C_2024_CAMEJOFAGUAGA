#!/bin/bash

echo "Creo los grupos de alumnos, parciales y profesores"

mkdir -p $HOME/Examenes-UTN/alumno_{1..3}/parcial_{1..3}/ $HOME/punto_A/Examenes-UTN/profesores

echo "Muestro el tree"

sudo tree $HOME/Examenes-UTN
