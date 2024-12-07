%{
#include<stdio.h>
#include "12.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUM; }
[ \t]+          ; /* Ignore whitespace */
\n              { return EOL; }
[-+*/()]        { return yytext[0]; }
.               { fprintf(stderr, "Error: Invalid Character\n"); }

%%
int yywrap() { return 1; }
