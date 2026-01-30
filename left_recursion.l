%{
#include <stdio.h>
#include <string.h>

char nt;
char prod[50];
%}

%%
[A-Z]->.* {
    nt = yytext[0];
    strcpy(prod, yytext + 3);

    char *left = strtok(prod, "|");
    char *right = strtok(NULL, "|");

    if(left[0] == nt) {
        printf("\nLeft Recursion Detected\n");
        printf("Original Grammar: %c -> %s | %s\n", nt, left, right);

        printf("\nAfter Eliminating Left Recursion:\n");
        printf("%c -> %s%c'\n", nt, right, nt);
        printf("%c' -> %s%c' | ε\n", nt, left + 1, nt);
    } else {
        printf("\nNo Left Recursion Present\n");
    }
}
%%

int main() {
    printf("Enter grammar (example: A->Aa|b): ");
    yylex();
    return 0;
}

