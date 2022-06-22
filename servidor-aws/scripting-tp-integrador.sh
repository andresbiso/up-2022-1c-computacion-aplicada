#!/bin/bash

#Obtiene un número para Fibonacci
get_num() {
    read NUM3;
    #Expresión regular para comparar
    re='^[0-9]+$'
    #Chequea si se ha ingresado un número con =~ que es el operador para matchear expresiones regulares con texto    
    if ! [[ $NUM3 =~ $re ]] ; then
        echo "Error: usted no ha ingresado un número, pruebe nuevamente" 
        get_num
    else
    return 0
    fi
}

#Obtiene una cadena para Palíndromo
get_cadena() {
    read CADENA
    #Chequea si la cadena está vacía
    if [ -z "$CADENA"  ]; then
        echo "Usted no ingresó ninguna cadena, intente nuevamente."
        get_cadena
    else
    return 0
    fi
}


#Se trata de una secuencia infinita de números naturales; a partir del 0 y el 1, se van sumando a pares, 
#de manera que cada número es igual a la suma de sus dos anteriores
fibonacci() {
	NUM1=0
	NUM2=1
	SUM=0
	echo "Ingrese un número entero con la cantidad de números de la sucesión de Fibonacci que desea ver"
	#OBTENGO NUM3
    get_num
    echo 
	for (( i = 1 ; i <= NUM3 ; i++ )); do
        	echo $SUM
		NUM1=$NUM2
		NUM2=$SUM
		SUM=$((NUM1+NUM2))
	done
	echo "Fin de sucesión!"
}

# Palabra o expresión que es igual si se lee de izquierda a derecha que de derecha a izquierda.
palindromo() {

    echo "Escriba una cadena de caracteres"
    #Obtengo CADENA
    get_cadena

    #Convierto la cadena a lowercase
    CADENA="${CADENA,,}"
    
    #Elimino los espacios, las comillas invertidas leen lo que devuelve echo
    CADENA=`echo ${CADENA//[[:blank:]]/}`

    #Unseteo variable para después cargar cadena en reversa para comparar
    unset REVERSA

    #Invierto los caracteres de la cadena con este loop.
    #En REVERSA voy cargando letra por letra CADENA de forma invertida. Si la palabra es ">
    #REVERSA = l + REVERSA (que arranca vacía: '')
    #REVERSA = a + REVERSA ('l')
    #REVERSA = g + REVERSA ('al')
    #REVERSA = o + REVERSA ('gal')
    for (( i = 0 ; i < ${#CADENA} ; i++ )) ; do
            REVERSA=${CADENA:i:1}$REVERSA
    done

    #Como se ve en este echo, los caracteres están invertidos pero aún son case sensitive.

    if [ $CADENA = $REVERSA ]; then
            echo "La cadena ingresada es un palíndromo"
    else
            echo "La cadena ingresada no es un palíndromo"
    fi

}

cuenta_lineas() {
    read -r -p "Ingrese la ruta de un archivo: " file_path
    if [ -f "$file_path" ]
    then
        lines_count=$(grep -c '' "$file_path")
        echo "El archivo tiene $lines_count lineas"
    else
        echo "No existe"
    fi
    
}

despedida() {
    echo "Hasta luego $USER!"
    exit 0
            
}

while true
do
    echo "Seleccione una opción: "
    echo "1) Fibonacci"
    echo "2) Palíndromo"
    echo "3) Contar líneas de archivo"
    echo "4) Salir"

    read -r -p "Opción: " option

    case $option in
        1) fibonacci ;;
        2) palindromo ;;
        3) cuenta_lineas ;;
        4) despedida ;;
        *) echo "Opcion incorrecta, ingrese un numero entre 1-4." ;;
    esac
    # Printea una línea vacía para dejar espacio entre las opciones
    echo
done
