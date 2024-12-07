%{ 
#include<stdio.h> 
#include<stdlib.h> 
#include<string.h> 
#define MAX_IDENTIFIER_LENGTH 50 
%} 
%option noyywrap 
%option yylineno 
void addtosymboltable(const char*) 
%% 
[\t] /*ignore whitespace*/ 
\n /*ignore newline*/ 
\/\*([^*]|\*+[^*/])*\*+\/ /*ignore comments*/ 
[0-9]+ {printf("Constant:%s \n",yytext);} 
= {printf("%s is an Assignment Operator\n",yytext);} 
\* | 
\+ | 
\- {printf("%s is a Operator\n",yytext);} 
if|else|int|float|char|void {printf("%s is a keyword\n",yytext);} 
[a-zA-Z][a-zA-Z0-9]* {printf("identifier:%s\n",yytext);} 
. {} 
%% 

int main() 
{ 
yylex(); return 1; 
}
 
