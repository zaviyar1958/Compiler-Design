%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
%}

%%
[A-Z]->[^\n]* {
    char nt;
    char prod[50], p1[25], p2[25];
    int i = 0;

    nt = yytext[0];
    strcpy(prod, yytext + 3);

    char *t1 = strtok(prod, "|");
    char *t2 = strtok(NULL, "|");

    if(t1 == NULL || t2 == NULL) {
        printf("Invalid grammar\n");
        exit(0);
    }

    strcpy(p1, t1);
    strcpy(p2, t2);

    while(p1[i] && p2[i] && p1[i] == p2[i])
        i++;

    if(i == 0) {
        printf("\nNo left factoring required\n");
        exit(0);
    }

    printf("\nAfter left factoring:\n");
    printf("%c -> ", nt);

    for(int j = 0; j < i; j++)
        printf("%c", p1[j]);

    printf("%c'\n", nt);

    printf("%c' -> ", nt);

    if(strlen(p1 + i) == 0)
        printf("ε");
    else
        printf("%s", p1 + i);

    printf(" | ");

    if(strlen(p2 + i) == 0)
        printf("ε");
    else
        printf("%s", p2 + i);

    printf("\n");

    exit(0);
}

\n ;
. ;
%%

int main() {
    printf("Enter the grammar: ");
    yylex();
    return 0;
}

