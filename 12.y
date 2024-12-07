%{
#include <stdio.h>
#include <stdlib.h>
int temp_count = 0;  
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}
%token NUM EOL
%left '+' '-'
%left '*' '/'
%%
program: lines
;
lines: lines line
     | line
;
line: expr EOL {
    printf("Result: t%d\n", $1);
}
;
expr: NUM {
    $$ = ++temp_count;
    printf("t%d = %d\n", $$, $1);  // literals
}
| '(' expr ')' {
    $$ = $2;
}
| expr '+' expr {
    $$ = ++temp_count;
    printf("t%d = t%d + t%d\n", $$, $1, $3);  // addition
}
| expr '-' expr {
    $$ = ++temp_count;
    printf("t%d = t%d - t%d\n", $$, $1, $3);  // subtraction
}
| expr '*' expr {
    $$ = ++temp_count;
    printf("t%d = t%d * t%d\n", $$, $1, $3);  // multiplication
}
| expr '/' expr {
    if ($3 == 0) {
        yyerror("Division by zero");
        $$ = 0;
    } else {
        $$ = ++temp_count;
        printf("t%d = t%d / t%d\n", $$, $1, $3);  // division
    }
}
;
%%
int main() {
    printf("\nExpression to 3 addr code\n");
    printf("Enter Expression: ");
    yyparse();
    return 0;
}