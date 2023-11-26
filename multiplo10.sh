#!/bin/bash
# Esta línea indica que el intérprete a utilizar es bash.

echo "Ingrese un número:"
# Muestra un mensaje en la pantalla solicitando al usuario que ingrese un número.

read numero
# Lee la entrada del usuario y almacena el valor en la variable 'numero'.

# Validar si la entrada es un número
if [[ ! $numero =~ ^[0-9]+$ ]]; then
  # Utiliza una expresión regular para verificar si 'numero' contiene solo dígitos.
  echo "Error: Debes ingresar un número entero."
  # Muestra un mensaje de error si la entrada no es un número entero.
  exit 1
  # Finaliza el script con un código de error (1) debido a la entrada incorrecta.
fi

if ((numero % 10 == 0)); then
  # La condición verifica si el residuo de 'numero' dividido por 10 es igual a 0.
  # El doble paréntesis indican una expresión aritmética en bash.
  echo "$numero es un múltiplo de 10."
  # Si la condición es verdadera, muestra un mensaje indicando que el número es un múltiplo de 10.
else
  echo "$numero no es un múltiplo de 10."
  # Si la condición es falsa, muestra un mensaje indicando que el número no es un múltiplo de 10.
fi
# Fin del bloque condicional.

