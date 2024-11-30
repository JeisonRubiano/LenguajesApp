%{
#include "tsintactico_creativo.tab.h"
%}

incrementador "++"|"--"
%%
"#"                     {return FIN_LINEA;}
"entero"                {return ENTE;}
"texto"                 {return TXT;}
"decimal"               {return DECI;}
"bandera"               {return COND;}
"funcion"               {return FUNC;}
"ciclo"                 {return CICL;}
"["                     {return APC;}
"]"                     {return CPC;}
"{"                     {return ACO;}
"}"                     {return CCO;}
":"                     {return DBP;}
","                     {return COM;}
";"                     {return PYC;}
"<"                     {return MEN;}
"<="                    {return MEI;}
">"                     {return MAY;}
">="                    {return MAI;}
"="                     {return IGU;}
"!="                    {return NIG;}
"&"                     {return Y;}
"|"                     {return O;}
"mientras"              {return MTS;}
"sipi"                  {return SIP;}
"sinopi"                {return NOP;}
"retorno"               {return DEV;}
{incrementador}         {return INCR;}
\+			             {return SUM;}
\*			             {return MUL;}
\-			             {return RES;}
\/			             {return DIV;}
"intento"               {return INT;}
"captura"               {return CAP;}
[A-Za-z0-9]+		{return VALOR;}
[ \t\n]                 {/* Ignorar espacios */}
.			            {printf("Error léxico: %s\n", yytext);}
%%
int yywrap() { return 1; }
