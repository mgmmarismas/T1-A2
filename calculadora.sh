#!/bin/bash

# Al comienzo del script
LOG_FILE="calculadora.log"

# Funciones

# Función para realizar la suma de dos números
sumar() {
    read -p "Ingrese el primer número: " num1
    read -p "Ingrese el segundo número: " num2

    # Validar si ambos valores son números enteros
    if ! [[ "$num1" =~ ^[0-9]+$ || "$num2" =~ ^[0-9]+$ ]]; then
        echo "Error: Debes ingresar números válidos." | tee -a "$LOG_FILE"
    else
        resultado=$((num1 + num2))
        echo "El resultado de la suma es: $resultado"
    fi
}

# Función para realizar la resta de dos números
restar() {
    read -p "Ingrese el primer número: " num1
    read -p "Ingrese el segundo número: " num2

    # Validar si ambos valores son números enteros
    if ! [[ "$num1" =~ ^[0-9]+$ || "$num2" =~ ^[0-9]+$ ]]; then
        echo "Error: Debes ingresar números válidos." | tee -a "$LOG_FILE"
    else
        resultado=$((num1 - num2))
        echo "El resultado de la resta es: $resultado"
    fi
}

# Función para realizar la división de dos números
dividir() {
    read -p "Ingrese el dividendo: " dividendo
    read -p "Ingrese el divisor: " divisor

    # Validar si ambos valores son números enteros
    if ! [[ "$dividendo" =~ ^[0-9]+$ || "$divisor" =~ ^[0-9]+$ ]]; then
        echo "Error: Debes ingresar números válidos." | tee -a "$LOG_FILE"
    elif [ "$divisor" -eq 0 ]; then
        echo "Error: No se puede dividir por cero." | tee -a "$LOG_FILE"
    else
        resultado=$(bc <<< "scale=2; $dividendo / $divisor")
        echo "El resultado de la división es: $resultado"
    fi
}

# Función para realizar la multiplicación de dos números
multiplicar() {
    read -p "Ingrese el primer número: " num1
    read -p "Ingrese el segundo número: " num2

    # Validar si ambos valores son números enteros
    if ! [[ "$num1" =~ ^[0-9]+$ || "$num2" =~ ^[0-9]+$ ]]; then
        echo "Error: Debes ingresar números válidos." | tee -a "$LOG_FILE"
    else
        resultado=$((num1 * num2))
        echo "El resultado de la multiplicación es: $resultado"
    fi
}

# Bucle principal
while true; do
    echo "Menú:"
    echo "1) Sumar"
    echo "2) Restar"
    echo "3) Dividir"
    echo "4) Multiplicar"
    echo "5) Salir"

    read -p "Seleccione una opción (1-5): " opcion

    case $opcion in
        1) sumar ;;         # Invocar la función de suma
        2) restar ;;        # Invocar la función de resta
        3) dividir ;;       # Invocar la función de división
        4) multiplicar ;;   # Invocar la función de multiplicación
        5) echo "Saliendo..." ; break ;;  # Salir del bucle
        *) echo "Opción no válida. Por favor, elija una opción del 1 al 5." | tee -a "$LOG_FILE" ;;
    esac
done

