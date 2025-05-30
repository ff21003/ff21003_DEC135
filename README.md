# ff21003_DEC135
Ejercicios en Lenguaje Ensamblador (Intel x86) – NASM

Este repositorio incluye ejercicios en lenguaje ensamblador (ASM) utilizando la sintaxis Intel. Están diseñados para ejecutarse en sistemas Linux de 32 bits (por ejemplo, WSL con Debian), usando el ensamblador NASM y el linker ld.

Se utilizan registros de diferentes tamaños (8, 16 y 32 bits), se convierten los resultados numéricos a texto (ASCII) para mostrarlos en consola.

---

## Requisitos

- Linux de 32 bits (WSL + Debian recomendado)
- NASM (Netwide Assembler)
- ld (Linker incluido en binutils)


## Descripción detallada de cada ejercicio

1. resta.asm – Resta de 3 números enteros con registros de 16.

Descripción:
Este programa realiza la operación 50 - 20 - 5 utilizando registros de 16 bits. El resultado se almacena en AX, se convierte manualmente a formato ASCII y se muestra en consola junto con un mensaje de respuesta.

Entrada: 50, 20, 5

Operación: 50 - 20 - 5

Resultado:

El resultado de restar 50 - 20 - 5 es: 25



---

2. multiplicacion.asm – Multiplicación de 2 números enteros usando registros de 8 bits.

Descripción:
Este programa realiza la multiplicación 10 * 7 utilizando registros de 8 bits (AL y BL). El resultado de la multiplicación se almacena en AX, luego se convierte a texto ASCII y se imprime en consola.

Entrada: 10, 7

Operación: 10 * 7

Resultado:

El resultado de multiplicar 10 * 7 es: 70



---

3. division.asm – División de 2 números enteros utilizando registros de 32 bits.

Descripción:
Este ejercicio divide 75 entre 15 usando registros de 32 bits (EAX, EDX, ECX). Solo se imprime el cociente, convertido a texto ASCII para ser mostrado en consola.

Entrada: 75, 15

Operación: 75 / 15

Resultado:

El resultado de dividir 75 / 15 es: 5


## Autor: Tania Sofía Franco
