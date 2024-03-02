#!/bin/bash

# Nombre del archivo de entrada
archivo_entrada="Accidentes_aggs_2021.csv"

# Iterar sobre cada línea del archivo
while IFS= read -r linea; do
    # Obtener el contenido de la columna 1 (ID)
    id=$(echo "$linea" | awk '{print $1}')
    # Obtener el contenido de la columna 22
    ferrocarril=$(echo "$linea" | awk '{print $22}')
    # Verificar si el contenido de la columna 1 es "ID" y el de la columna 22 es "FERROCARRI" y no "CONSTITUCIÓN"
    if [[ "$id" == "ID" && "$ferrocarril" == "FERROCARRI" && "$ferrocarril" != "CONSTITUCIÓN" ]]; then
        echo "ID: $id - Ferrocarril: $ferrocarril"
    fi
done < "$archivo_entrada"