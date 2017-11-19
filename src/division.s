# tarea01 - division.s
# Nombre: Luis Lama Aguirre
# Fecha (yyyy/mm/dd): 2017/11/16

        .data
									#declaracion de variables
residuo: .word 2147483647
divisor: .word 32767
cociente: .word 0
iteraciones: .word 17

									#strings a imprimir
saludo: .asciiz "Bienvenido!!"
instr0: .asciiz "\nDividir "
instr1: .asciiz " para "
instr2: .asciiz " da como resultado..."
resultado: .asciiz "\nCociente: ";
resto: .asciiz "\nResiduo: ";

        .text
        .globl main
main:
        lw $t0, residuo
        lw $t1, divisor
		sll $t1, $t1, 16			#El divisor debe de estar en la primera mitad del registro de 32 bits | 16 <--
        lw $t2, cociente
		li $t3, 0                   #contador inicia en 0
		lw $t4, iteraciones         #numero de iteraciones usando 32 bits
		

paso1:
        addi $t3, $t3, 1
        sub $t0, $t0, $t1
		
#pruebaResiduo:
        blt, $t0, $zero paso2b
		
#paso2a:
        sll $t2, $t2, 1
        addi $t2, $t2, 1
        j paso3
		
paso2b:
        add $t0, $t0, $t1
        sll $t2, $t2, 1
		
paso3:
        srl $t1, $t1, 1

#pruebaNumeroIteracion
		blt $t3, $t4, paso1

		
									#A partir de aqui solo estan los prints
end:
		#"Bienvenido!!"
        li $v0, 4
		la $a0, saludo
		syscall

	    #"\nDividir "
        li $v0, 4
		la $a0, instr0
		syscall
		#"dividendo(int)"
        li $v0, 1
		lw $t1, residuo
		move $a0, $t1
		syscall				
		#" para "
        li $v0, 4
		la $a0, instr1
		syscall
		#"divisor(int)"
        li $v0, 1
		lw $t3, divisor
		move $a0, $t3
		syscall
		#" da como resultado"
        li $v0, 4
		la $a0, instr2
		syscall
		
		#"\nCociente: "
        li $v0, 4
		la $a0, resultado
		syscall
		#"cociente(int)"
        li $v0, 1
		move $a0, $t2
		syscall
		
		#"\nResiduo: "
        li $v0, 4
		la $a0, resto
		syscall
		#"residuo(int)"
        li $v0, 1
		move $a0, $t0
		syscall
		
									#sale del programa
		li $v0, 10
        syscall