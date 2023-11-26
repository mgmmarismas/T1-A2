#!/bin/bash

# Solicitar dos números por teclado
echo "Ingrese el primer número:"
read numero1

# Validar si la entrada es un número
if ! [[ "$numero1" =~ ^[0-9]+$ ]]; then
  echo "Error: Debes ingresar un número válido."
  exit 1
fi

echo "Ingrese el segundo número:"
read numero2

# Validar si la entrada es un número
if ! [[ "$numero2" =~ ^[0-9]+$ ]]; then
  echo "Error: Debes ingresar un número válido."
  exit 1
fi

# Comprobar qué número es menor
if [ "$numero1" -gt "$numero2" ]; then
  # Si el primer número es mayor, intercambiar valores
  temp=$numero1
  numero1=$numero2
  numero2=$temp
fi

# Calcular la suma utilizando seq
suma_seq=$(seq $numero1 $numero2 | paste -sd+ - | bc)

# Calcular la suma utilizando la nomenclatura de C
suma_c=$(( (numero1 + numero2) * (numero2 - numero1 + 1) / 2 ))

# Mostrar los resultados
echo "La suma utilizando seq es: $suma_seq"
echo "La suma utilizando la nomenclatura de C es: $suma_c"

