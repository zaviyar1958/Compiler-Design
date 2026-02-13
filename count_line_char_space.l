%{#include<stdio.h>
int l = 0, c = 0, s = 0, t = 0; 
%}

%%

["\n"] {printf("\nNew line");l++;}
["\t"] {printf("\nTab");t++;}
[a-zA-Z] {printf("\nCharacter");c++;}
[" "] {printf("\nSpace");s++;}

%%

int yywrap() {return 1;}
void main() 
{
	printf("\nEnter your string: ");
	yylex();
	printf("\nNumber of New line = %d",l);
	printf("\nNumber of Tab = %d",t);
	printf("\nNumber of Character = %d",c);
	printf("\nNumber of Space = %d",s);
}
