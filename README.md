# MIPS-division-32bits
Desarrollo de un programa utilizando **MIPS**, para obtener el cociente y el residuo de una división sin utilizar div.

## Consideraciones
El algoritmo que se emplea, utiliza registros de 32 bits y coloca al divisor en la mitad izquierda del registro, por este motivo:
* El dividendo debe ocupar como máximo 31 bits en el sistema binario.
* El divisor debe ocupar como máximo 15 bits en el sistema binario.

## Pendiente
Pedir al usuario el ingreso de los números dividendo y divisor por consola. En lugar de hacerlo modificando el archivo antes de cargarlo y arrancarlo.