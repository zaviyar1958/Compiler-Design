%{#include<stdio.h>
int v = 0, c = 0;
%}

%%

['a'|'e'|'i'|'o'|'u'|'A'|'E'|'I'|'O'|'U'] {printf("\nVowel");v++;}
[a-zA-Z] {printf("\nconsonent");c++;}

%%
int yywrap() {return 1;}
void main()
{
	printf("\nEnter you string: ");
	yylex();
	printf("\nNumber of vowels = %d",v);
	printf("\nNumber of consonent = %d",c);
}
