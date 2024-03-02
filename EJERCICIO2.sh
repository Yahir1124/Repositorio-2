#!/bin/bash

# Nombre del archivo de entrada
archivo_entrada="Accidente_ags_2021.csv"

# Iterar sobre cada línea del archivo
while IFS= read -r linea; do
    # Obtener el contenido de la columna 1 (ID)
    id=$(echo "$linea" | awk '{print $1}')
    # Obtener el contenido de la columna 24
    transporte=$(echo "$linea" | awk '{print $24}')
    # Obtener la ubicación
    ubicacion=$(echo "$linea" | awk '{print $NF}')
    # Verificar si el contenido de la columna 1 es "ID" y el de la columna 24 es "bicicleta" y la ubicación es "aguacalientes"
    if [[ "$id" == "ID" && "$transporte" == "bicicleta" && "$ubicacion" == "aguacalientes" ]]; then
        echo "ID: $id - Transporte: $transporte - Ubicación: $ubicacion"
    fi
done < "$archivo_entrada"