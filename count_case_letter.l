%{#include<stdio.h>
int l = 0, u = 0 ;
%}

%%

[a-z] {printf("\nLowercase");l++;}
[A-Z] {printf("\nUppercase");u++;}

%%

int yywrap() {return 1 ;}
void main() 
{
	printf("Enter your string : ");
	yylex();
	printf("\nNumber of Lowercase letter = %d",l);
	printf("\nNumber of Uppercase letter = %d",u);
}
