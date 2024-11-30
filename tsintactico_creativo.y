%{
#include <stdio.h>
extern int yylex(void);
extern char *yytext;
void yyerror(const char *s);
extern FILE *yyin;
%}

%token FIN_LINEA ENTE TXT DECI COND COM FUNC CICL APC CPC DBP PYC DEV ACO CCO MEN MEI MAY MAI IGU NIG Y O INCR MTS SIP NOP SUM MUL RES DIV INT CAP VALOR
%%

lineas      :  
            | lineas mivariable
            | lineas vueltas FIN_LINEA
            | lineas condicional FIN_LINEA
            | lineas funcion FIN_LINEA
            | lineas llamadofuncion FIN_LINEA
            | lineas falla FIN_LINEA
            | lineas operacion FIN_LINEA
            ;

vueltas     : CICL APC mibucle PYC condicion PYC aumento CPC ACO lineas CCO
            | MTS APC condicion CPC ACO lineas CCO
            ;

condicional : SIP APC condicion CPC ACO lineas CCO 
            | SIP APC condicion CPC ACO lineas CCO NOP ACO lineas CCO
            ;

funcion      : datos VALOR APC parametros CPC ACO lineas DEV VALOR CCO
            | FUNC VALOR APC parametros CPC ACO lineas CCO
            | datos VALOR APC CPC ACO lineas DEV VALOR CCO
            | FUNC VALOR APC CPC ACO lineas CCO
            ;
        
llamadofuncion : VALOR APC iparametros CPC
            | VALOR APC CPC   
            ;

parametros  : parametro 
            | parametros COM parametro
            ;

parametro   : datos VALOR
            ;

iparametros : iparametro
            | iparametros COM iparametro
            ;

iparametro  : VALOR
            ;

mivariable  : datos VALOR FIN_LINEA 
            | datos VALOR DBP VALOR FIN_LINEA 
            ;

mibucle      : datos VALOR DBP VALOR
            ;

falla       : INT ACO lineas CCO CAP ACO lineas CCO 
            ;

operacion   : VALOR operadora VALOR 
            ;

aumento     : VALOR INCR
            ;

condicion   : VALOR operador VALOR
            | VALOR operador VALOR conector VALOR operador VALOR
            ;

operadora   : SUM   
            | RES
            | MUL
            | DIV
            ;

datos       : ENTE
            | TXT
            | DECI
            | COND
            ;

operador    : MEN
            | MEI
            | MAY
            | MAI
            | IGU
            | NIG
            ;

conector    : Y 
            | O
            ;
%%

void yyerror(const char *s) {
    printf("Error Sintáctico: %s\n", s);
}

int main(int argc, char **argv) {
    printf("Inicio del programa:\n");
    if (argc > 1) {
        yyin = fopen(argv[1], "rt");
    } else {
        yyin = stdin;
    }
    yyparse();
    return 0;
}
