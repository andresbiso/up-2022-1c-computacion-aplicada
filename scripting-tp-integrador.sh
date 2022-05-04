#!/bin/bash
#
NUM1=0
NUM2=1
SUM=0
echo "Ingrese un número entero"
read NUM3
for (( i = 1 ; i <= NUM3 ; i++ )); do
        echo $SUM
	let NUM1=$NUM2
	let NUM2=$SUM
	SUM=$((NUM1+NUM2))
done

echo "Escriba una cadena de caracteres"
read CADENA
unset REVERSA

for (( i = 0 ; i < ${#CADENA} ; i++ )) ; do
	REVERSA=${CADENA:i:1}$REVERSA
done

echo $REVERSA

if [ $CADENA = $REVERSA ]; then
	echo "La cadena ingresada es un palíndromo"
else
	echo "La cadena ingresada no es un palíndromo"
fi


