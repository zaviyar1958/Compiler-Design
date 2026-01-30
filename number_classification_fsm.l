%{
#include <stdio.h>
#include <string.h>
%}

%%
[+-]?[0-9]+(\.[0-9]+)?[eE][+-]?[0-9]+$ {
    printf("EXPONENT NUMBER\n");
    yyterminate();
}

[+-]?[0-9]*\.[0-9]+$ {
    printf("REAL NUMBER\n");
    yyterminate();
}

[+-]?[0-9]+$ {
    printf("INTEGER NUMBER\n");
    yyterminate();
}

.*$ {
    printf("INVALID NUMBER\n");
    yyterminate();
}
%%

int main()
{
    char input[100];

    printf("Enter a number: ");
    fgets(input, sizeof(input), stdin);

    yy_scan_string(input);   // scan entire input as ONE token
    yylex();

    return 0;
}

