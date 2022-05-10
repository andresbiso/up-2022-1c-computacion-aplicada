#!/bin/bash

while true
do
    echo "Seleccione una opción: "
    echo "1) Fibonacci"
    echo "2) Palíndromo"
    echo "3) Líneas archivo"
    echo "4) Salir"

    read -r -p "Opción: " option

    case $option in
        1)
            echo "NotImplemented"
            ;;
        2)
            echo "NotImplemented"
            ;;
        3)
            read -r -p "Ingrese la ruta de un archivo: " file_path
            if [ -f "$file_path" ]
            then
                lines_count=$(grep -c '' "$file_path")
                echo "El archivo tiene $lines_count lineas"
            else
                echo "No existe"
            fi
            ;;
        4)
            echo "Hasta luego!"
            exit 0
            ;;
        *)
            echo "Opcion incorrecta, ingrese un numero entre 1-4."
            ;;
    esac
    # Printea una línea vacía para dejar espacio entre las opciones
    echo
done
