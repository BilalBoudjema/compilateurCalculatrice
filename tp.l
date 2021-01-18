%{
#include<stdlib.h>
#include"tp.tab.h"
%}
blanc [ \t]+
chiffre [0-9]
entier {chiffre}+
%%
{blanc}
{entier} {
 yylval=atoi(yytext);
 return(NOMBRE);
 }
"+" return(PLUS);
"*" return(MULT);
"-" return(MOIN);
"/" return(DIVS);
"^" return(PUIS);
"(" return(PARG);
")" return(PARD);
"=" return(FIN);
\n {}
%%