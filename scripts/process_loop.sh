#!/bin/bash

# Script para simular carga de proceso
echo "Proceso de monitoreo iniciado. Presione Ctrl+C para detener o use 'kill' desde otra terminal."
echo "Buscando fugas de memoria simuladas..."

# Bucle infinito para que aparezca en htop/ps
while true; do
    # Realiza una operación simple de cálculo para mantener el proceso activo
    echo "Calculando integridad de datos..." > /dev/null
    sleep 1
done
