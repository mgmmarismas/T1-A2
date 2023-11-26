#!/bin/bash
# Esta línea indica que el intérprete a utilizar es bash.

# Comprobación de parámetros
if [ "$#" -eq 0 ]; then
  # Verifica si no se proporciona ningún parámetro (directorio).
  echo "Error: Debes proporcionar un directorio como parámetro."
  # Muestra un mensaje de error indicando que se necesita un directorio.
  exit 1
  # Finaliza el script con un código de error (1) debido a la entrada incorrecta.
fi

directorio="$1"
# Asigna el directorio proporcionado como primer parámetro a la variable 'directorio'.

# Validar si el directorio existe
if [ ! -d "$directorio" ]; then
  # Verifica si el directorio no existe.
  echo "Error: El directorio proporcionado no existe."
  # Muestra un mensaje de error indicando que el directorio no existe.
  exit 1
  # Finaliza el script con un código de error (1) debido a la entrada incorrecta.
fi

# Contar ficheros (excluyendo directorios)
cantidad_ficheros=$(find "$directorio" -maxdepth 1 -type f | wc -l)
# Utiliza el comando 'find' para listar ficheros (sin incluir subdirectorios).
# El resultado se pasa al comando 'wc -l' para contar las líneas, que representa la cantidad de ficheros.

# Verificar cantidad de ficheros
if [ "$cantidad_ficheros" -gt 10 ]; then
  # Verifica si la cantidad de ficheros es mayor que 10.
  echo "Hay más de 10 ficheros en el directorio."
  # Muestra un mensaje indicando que hay más de 10 ficheros.
else
  echo "No hay más de 10 ficheros en el directorio."
  # Si la cantidad de ficheros no es mayor que 10, muestra un mensaje indicando que no hay más de 10 ficheros.
fi

