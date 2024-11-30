#!/bin/bash
# Limpiar archivos generados anteriormente
rm -f lex.yy.c tsintactico_creativo.tab.*

# Generar los archivos léxicos y sintácticos
flex tlexico_creativo.l
bison -d tsintactico_creativo.y

# Compilar el analizador
gcc lex.yy.c tsintactico_creativo.tab.c -lfl -o analizador_creativo

# Ejecutar el analizador con el archivo de pruebas
./analizador_creativo pruebas_creativo.txt
