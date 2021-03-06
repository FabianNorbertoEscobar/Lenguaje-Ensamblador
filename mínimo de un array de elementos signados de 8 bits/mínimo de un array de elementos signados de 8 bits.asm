* buscar minimo de un array de numeros signados de 8 bits
* se conocen la cantidad de elementos del vector y la direccion de fin

	ORG	0000
cant	RMB	1		cantidad de elementos del array
dirFin	RMB	2		direccion final del array
min	RMB	1		minimo valor del array

	ORG	$C000
	LDX	dirFin	 	cargo la anteultima direccion del array en regX
	LDAA	0,x		cargo en el acumA el contenido de la dir del reg indice x
	STAA	min		considero al primer elemento como el minimo
	LDAB	cant		cargo al acumB con la cantidad de elementos del array menos uno
	DECB			decremento el acumB
	DEX			decremento el indice x
	
bucle	LDAA	0,x		cargo el contenido de la dir del reg ind x en el acumA
	CMPA	min		comparo dicho numero contra el minimo
	BGT	sig		si es mayor o igual, salto
	STAA	min		sino, es el nuevo minimo--> lo almaceno

sig	DEX			decremento el registro indice
	DECB	cant		decremento acumB->la cantidad de elementos a recorrer
	BNE	bucle		si no llego a cero, entonces ejecuto el bucle

fin	BRA	fin