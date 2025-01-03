%{
#include<stdio.h>
int yylex();
%}
%token IF ELSE WHILE FOR SWITCH CASE DEFAULT OPEN_BRACE CLOSE_BRACE
SEMICOLON COLON OPEN_BRACKET CLOSE_BRACKET BREAK
%%
program: statement
| program statement
;
statement:if_statement
|while_loop
|switch_case_statement
|for_loop
;
if_statement:IF OPEN_BRACKET expression_opt CLOSE_BRACKET OPEN_BRACE
expression_opt CLOSE_BRACE ELSE OPEN_BRACE expression_opt CLOSE_BRACE
{
printf("Recognized IF Else statement\n");
}
;
while_loop:WHILE OPEN_BRACKET expression_opt CLOSE_BRACKET OPEN_BRACE
expression_opt CLOSE_BRACE
{
printf("Recognized WHILE loop\n");
}
;
switch_case_statement:SWITCH OPEN_BRACKET expression_opt CLOSE_BRACKET
OPEN_BRACE case_list CLOSE_BRACE
{
printf("Recognized SWITCH_CASE statement with DEFAULT\n");
}
;
for_loop:FOR OPEN_BRACKET expression_opt SEMICOLON expression_opt
CLOSE_BRACKET OPEN_BRACE expression_opt CLOSE_BRACE
{
printf("Recognized FOR loop\n");
}
;
case_list:CASE expression COLON expression BREAK
SEMICOLON DEFAULT COLON expression_opt
;
expression_opt:/*empty*/
|expression
|expression SEMICOLON
;
expression:
;
%%
int yyerror(const char *s)
{
fprintf(stderr,"Error=%s\n", s);
return 1;
}
int main() {
if(yyparse()==0){
printf("Parsing completed successfully\n");
}
else{
fprintf(stderr,"Parsing encountered errors\n");
}
return 0;
}
