#!/bin/bash

# Solicitar el año de nacimiento al usuario
echo "Ingrese el año de nacimiento:"
read ano_nacimiento

# Comprobación de la entrada
if [[ ! $ano_nacimiento =~ ^[0-9]{4}$ ]]; then
    echo "Error: Por favor, introduzca un año de nacimiento válido (4 cifras)."
    exit 1
fi

# Crear un array con los animales del horóscopo chino
declare -a animales=("El mono" "El gallo" "El perro" "El cerdo" "La rata" "El buey" "El tigre" "El conejo" "El dragón" "La serpiente" "El caballo" "La cabra")

# Calcular el animal del horóscopo chino
indice_animal=$(( $ano_nacimiento % 12 ))
echo "Según el horóscopo chino, naciste bajo el signo de: ${animales[$indice_animal]}"

