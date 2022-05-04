#!/bin/bash
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

echo "Escriba una cadena de caracteres"
read CADENA
unset REVERSA

#Invierto los caracteres de la cadena con este loop.
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


