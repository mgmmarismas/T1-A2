#!/bin/bash
# diadelmes.sh

# Obtiene el mes actual
mes_actual=$(date +%m)

# Determina los días del mes actual
if [[ $mes_actual == 01 || $mes_actual == 03 || $mes_actual == 05 || $mes_actual == 07 || $mes_actual == 08 || $mes_actual == 10 || $mes_actual == 12 ]]; then
    dias=31
elif [[ $mes_actual == 04 || $mes_actual == 06 || $mes_actual == 09 || $mes_actual == 11 ]]; then
    dias=30
else
    dias=28
fi

# Muestra el resultado
echo "Estamos en $(date +%B), un mes con $dias días."

