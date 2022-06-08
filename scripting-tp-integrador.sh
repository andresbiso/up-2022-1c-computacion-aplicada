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
	#Declaro las 3 variables en mayúscula, siguiendo la convención de bash.
	NUM1=0
	NUM2=1
	SUM=0
	echo "Ingrese un número entero con la cantidad de números de la sucesión de Fibonacci que desea ver"
	read NUM3
	for (( i = 1 ; i <= NUM3 ; i++ )); do
        	echo $SUM
		let NUM1=$NUM2
		let NUM2=$SUM
		SUM=$((NUM1+NUM2))
	done
	echo "Fin de sucesión!"
            ;;
        2)
	echo "Escriba una cadena de caracteres"
	read CADENA
	unset REVERSA

	#Invierto los caracteres de la cadena con este loop.
	#En REVERSA voy cargando letra por letra CADENA de forma invertida. Si la palabra es "lago", funciona así:
	#REVERSA = l + REVERSA (que arranca vacía: '')
	#REVERSA = a + REVERSA ('l')
	#REVERSA = g + REVERSA ('al')
	#REVERSA = o + REVERSA ('gal')
	for (( i = 0 ; i < ${#CADENA} ; i++ )) ; do
		REVERSA=${CADENA:i:1}$REVERSA
	done

	#Como se ve en este echo, los caracteres están invertidos pero aún son case sensitive.
 
	echo $REVERSA

	if [ $CADENA = $REVERSA ]; then
		echo "La cadena ingresada es un palíndromo"
	else
		echo "La cadena ingresada no es un palíndromo"
	fi
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
            echo "Hasta luego $USER!"
            exit 0
            ;;
        *)
            echo "Opcion incorrecta, ingrese un numero entre 1-4."
            ;;
    esac
    # Printea una línea vacía para dejar espacio entre las opciones
    echo
done
