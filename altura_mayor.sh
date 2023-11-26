#!/bin/bash
# Esta línea indica que el intérprete a utilizar es bash.

echo "Ingrese la altura en centímetros de la primera persona:"
# Muestra un mensaje en la pantalla solicitando al usuario que ingrese la altura de la primera persona.

read altura1
# Lee la entrada del usuario y almacena el valor en la variable 'altura1'.

# Validar si la entrada es un número positivo
if [[ ! $altura1 =~ ^[0-9]+$ || $altura1 -le 0 ]]; then
  # Utiliza una expresión regular y una comparación numérica para verificar si 'altura1' es un número positivo.
  echo "Error: Debes ingresar una altura válida en centímetros."
  # Muestra un mensaje de error si la entrada no es un número positivo.
  exit 1
  # Finaliza el script con un código de error (1) debido a la entrada incorrecta.
fi

echo "Ingrese la altura en centímetros de la segunda persona:"
# Muestra un mensaje en la pantalla solicitando al usuario que ingrese la altura de la segunda persona.

read altura2
# Lee la entrada del usuario y almacena el valor en la variable 'altura2'.

# Validar si la entrada es un número positivo
if [[ ! $altura2 =~ ^[0-9]+$ || $altura2 -le 0 ]]; then
  echo "Error: Debes ingresar una altura válida en centímetros."
  exit 1
fi

echo "Ingrese la altura en centímetros de la tercera persona:"
# Muestra un mensaje en la pantalla solicitando al usuario que ingrese la altura de la tercera persona.

read altura3
# Lee la entrada del usuario y almacena el valor en la variable 'altura3'.

# Validar si la entrada es un número positivo
if [[ ! $altura3 =~ ^[0-9]+$ || $altura3 -le 0 ]]; then
  echo "Error: Debes ingresar una altura válida en centímetros."
  exit 1
fi

mayor_altura=$altura1
# Inicializa la variable 'mayor_altura' con la altura de la primera persona.

if ((altura2 > mayor_altura)); then
  mayor_altura=$altura2
fi
# Compara la altura de la segunda persona con la 'mayor_altura' actual.
# Si la altura de la segunda persona es mayor, actualiza 'mayor_altura'.

if ((altura3 > mayor_altura)); then
  mayor_altura=$altura3
fi
# Compara la altura de la tercera persona con la 'mayor_altura' actual.
# Si la altura de la tercera persona es mayor, actualiza 'mayor_altura'.

mayor_altura=$(echo "scale=2; $mayor_altura / 100" | bc)
# Utiliza el comando 'echo' con 'scale' para establecer la precisión decimal a 2.
# Divide la 'mayor_altura' por 100 para convertir de centímetros a metros utilizando 'bc'.

echo "La mayor altura es $mayor_altura metros."
# Muestra en la pantalla el resultado indicando cuál es la mayor altura en metros.

