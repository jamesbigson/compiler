%option noyywrap
%{ 
int COMMENT=0; 
%} 

%option noyywrap 
identifier[a-zA-Z][a-zA-Z0-9]* 

%% 
#.* {printf("\n %s is a preprocessor directive",yytext); } 
if|else|int|float|char|void|for|while|clrscr|getch|printf|scanf {printf("%s is a keyword",yytext);} 
"/*" {COMMENT=1;printf("it comment");} 
"*/" {COMMENT=0;} 
{identifier}\( {if(!COMMENT)printf("\n Function:\t %s",yytext);} 
\{ {if(!COMMENT)printf("\n Block begins");} 
\} {if(!COMMENT)printf("\n Block ends");} 
{identifier}(\[[0-9]*\])? {if(!COMMENT)printf("\n %s is an Identifier",yytext);} 
\".*\" {if(!COMMENT)printf("\n %s is a string",yytext);} 
[0-9]+ {if(!COMMENT)printf("\n %s is a number",yytext);} 
\)(\;)? {if(!COMMENT)printf("\t");ECHO;printf("\n");} 
\(ECHO; 
= {if(!COMMENT)printf("\n %s is an Assignment operator",yytext);} 
\<= | 
\>= | 
\< | 
== {if(!COMMENT)printf("\n %s is a relational operator",yytext);} 
[-+*/] {if(!COMMENT)printf("\n %s is a operator",yytext);} 
.|\n 
%% 

int main() 
{
yylex();
printf("\n\n"); 
return 0; 
} 
