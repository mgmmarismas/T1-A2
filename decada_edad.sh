#!/bin/bash

# Solicitar la entrada de la edad al usuario
echo "Ingrese su edad:"
read edad

# Validar que la entrada sea un número en el rango correcto
if ! [[ $edad =~ ^[0-9]+$ ]] || ((edad < 15 || edad > 60)); then
  echo "Error: Debes ingresar un número válido entre 15 y 60 años."
  exit 1
fi

# Obtener el año actual
anio_actual=$(date +'%Y')

# Calcular el año de nacimiento
anio_nac=$((anio_actual - edad))

# Calcular la década
decada=$((anio_nac - (anio_nac % 10)))

# Mostrar el resultado
echo "Si naciste en $anio_nac, naciste en la década de $decada."

