%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

char prod[10][10];
int n;

/* function declarations */
void findFirst(char, int);
void findFollow(char);
%}

%%
.|\n ;
%%

int main() {
    int i;

    printf("Enter number of productions: ");
    scanf("%d", &n);

    printf("Enter productions (Example: S=Baa):\n");
    for (i = 0; i < n; i++) {
        scanf("%s", prod[i]);
    }

    /* FIRST SET */
    printf("\nFIRST Sets:\n");
    for (i = 0; i < n; i++) {
        printf("FIRST(%c) = { ", prod[i][0]);
        findFirst(prod[i][0], 1);
        printf("}\n");
    }

    /* FOLLOW SET */
    printf("\nFOLLOW Sets:\n");
    for (i = 0; i < n; i++) {
        printf("FOLLOW(%c) = { ", prod[i][0]);
        findFollow(prod[i][0]);
        printf("}\n");
    }

    return 0;
}

/* FUNCTION TO FIND FIRST */
void findFirst(char symbol, int firstCall) {
    int i;

    /* if terminal, print it */
    if (!isupper(symbol)) {
        printf("%c ", symbol);
        return;
    }

    for (i = 0; i < n; i++) {
        if (prod[i][0] == symbol) {
            /* check first RHS symbol */
            if (!isupper(prod[i][2]))
                printf("%c ", prod[i][2]);
            else
                findFirst(prod[i][2], 0);
        }
    }
}

void findFollow(char symbol) {
    char follow[10];
    int fcount = 0;
    int i, j, k;
    int found;

    /* Rule 1: Start symbol gets $ */
    if (prod[0][0] == symbol) {
        follow[fcount++] = '$';
    }

    /* Rule 2: Check all productions */
    for (i = 0; i < n; i++) {
        for (j = 2; j < strlen(prod[i]); j++) {
            if (prod[i][j] == symbol) {

                /* if symbol is followed by something */
                if (prod[i][j + 1] != '\0') {
                    if (!isupper(prod[i][j + 1])) {

                        /* avoid duplicates */
                        found = 0;
                        for (k = 0; k < fcount; k++) {
                            if (follow[k] == prod[i][j + 1])
                                found = 1;
                        }

                        if (!found)
                            follow[fcount++] = prod[i][j + 1];
                    }
                }
            }
        }
    }

    /* Print FOLLOW set */
    for (i = 0; i < fcount; i++)
        printf("%c ", follow[i]);
}

