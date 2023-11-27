#!/bin/bash

# Archivo de log para almacenar errores
LOG_FILE="usuarios_log.txt"

# Función para validar el formato del nombre de usuario
validar_formato_usuario() {
    local usuario="$1"

    # Verificar si el nombre de usuario cumple con el formato permitido
    if ! [[ "$usuario" =~ ^[a-z_][a-z0-9_-]{0,31}$ ]]; then
        echo "Error: Formato de nombre de usuario no válido." | tee -a "$LOG_FILE"
        return 1
    fi
}

# Función para verificar la existencia del usuario en el sistema
verificar_existencia_usuario() {
    local usuario="$1"

    # Verificar si el usuario existe utilizando el comando 'id'
    if ! id "$usuario" &>/dev/null; then
        echo "Error: El usuario $usuario no existe." | tee -a "$LOG_FILE"
        return 1
    fi
}

# Función para mostrar la información del usuario y su hash en /etc/shadow
mostrar_info_usuario() {
    local usuario="$1"

    # Validar el formato y existencia del usuario
    validar_formato_usuario "$usuario" || return 1
    verificar_existencia_usuario "$usuario" || return 1

    # Obtener información del usuario (UID, GID, grupos, directorio)
    uid=$(id -u "$usuario" 2>/dev/null)
    gid=$(id -g "$usuario" 2>/dev/null)
    info=$(id "$usuario" 2>/dev/null | awk -F " " '{print $3}')
    directorio=$(grep "^$usuario:" /etc/passwd | cut -d: -f6)
    # Obtener el hash de la contraseña
    hash=$(grep "$usuario" /etc/shadow | cut -d: -f2-)

    # Mostrar información básica del usuario
    echo "Información del usuario $usuario:"
    echo "UID: $uid"
    echo "GID: $gid"
    echo "Grupos: $info"
    echo "Directorio de trabajo: $directorio"
    # Mostrar el hash de la contraseña desde /etc/shadow
    echo -e "Hash: $hash"
 
}

# Función principal del bucle
bucle_principal() {
    while true; do
        read -p "Ingrese el nombre de usuario (o 'salir' para salir): " usuario

        # Salir del programa si se ingresa 'salir'
        if [ "$usuario" == "salir" ]; then
            echo "Saliendo del programa."
            exit 0
        fi

        # Llamar a la función para mostrar información del usuario
        mostrar_info_usuario "$usuario"
    done
}

# Iniciar el programa llamando a la función principal del bucle
bucle_principal

