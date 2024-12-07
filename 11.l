%{
#include <stdio.h>
#include "11.tab.c"
extern int yylval;
%}
%%

[0-9]+ {
yylval = atoi(yytext);
return NUMBER;
}
[ \t] ;
[\n] return 0;
. {return yytext[0];}
%%
int yywrap()
{
return 1;
}
