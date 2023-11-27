#!/bin/bash

# Verificar que se proporcionó un directorio como argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

directorio="$1"

# Verificar que el directorio existe
if [ ! -d "$directorio" ]; then
    echo "Error: El directorio '$directorio' no existe."
    exit 1
fi

# Obtener la fecha actual en el formato deseado (ddmmaaaa)
fecha_actual=$(date +"%d%m%Y")

# Crear el nombre del archivo tar
nombre_archivo="copia_scripts_$fecha_actual.tar"

# Empaquetar los scripts en un archivo tar
tar -cvf "$nombre_archivo" "$directorio"

# Verificar si el comando tar tuvo éxito
if [ "$?" -eq 0 ]; then
    echo "Scripts copiados en $nombre_archivo"
else
    echo "Error al crear el archivo tar."
fi

# Salir con el código de retorno del comando tar
exit $?

