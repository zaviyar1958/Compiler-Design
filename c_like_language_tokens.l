%{
#include <stdio.h>
%}

%%
int|float|char|double|if|else|while|for|return { printf("KEYOWRD : %s\n" , yytext); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER : %s\n" , yytext); }

[0-9]+ { printf("NUMBER : %s\n" , yytext); }

==|!=|<=|>=|=|\+|\-|\*|\/|\% {printf("OPERATOR : %s\n", yytext); }

[;:,()\{\}] {printf("SPECIAL SYMBOL : %s\n" , yytext); }

[ \t\n]+    ;   /* ignore whitespace */

.           { printf("UNKNOWN TOKEN : %s\n", yytext); }
%%

int main()
{
    printf("Enter C-like code:\n");
    yylex();
    return 0;
}
