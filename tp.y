%{
#include<conio.h>
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
%}
%token NOMBRE PLUS MOIN MULT DIVS PUIS PARG PARD FIN
%left PLUS MOIN
%left MULT DIVS
%left NEG
%right PUIS
%start Input
%%
Input:
 |Input Line
 ;
Line :FIN
 |Exp FIN {printf("=%d\n",$1);}
 ;
Exp :NOMBRE {$$=$1;}
 |Exp PLUS Exp {$$=$1+$3;}
 |Exp MOIN Exp {$$=$1-$3;}
 |Exp MULT Exp {$$=$1*$3;}
 |Exp DIVS Exp { if($3==0){
 						printf("devition sur 0/n");
 							}
 						else	
 							$$=$1/$3;}
 |MOIN Exp %prec NEG {$$=-$2;}
 |Exp PUIS Exp {$$=pow($1,$3);}
 |PARG Exp PARD {$$=$2;}
%%
int yyerror (char *s)
{
printf("%s\n",s);
}
int yywrap(){
return 1;
}
main()
{
yyparse();

}