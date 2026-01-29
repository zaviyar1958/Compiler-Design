%{
#include <stdio.h>
%}

%%
if      { printf("IF statement detected\n"); }
else    { printf("ELSE statement detected\n"); }
while   { printf("WHILE loop detected\n"); }
for     { printf("FOR loop detected\n"); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER detected\n"); }
[0-9]+  { printf("NUMBER detected\n"); }
[ \t\n]+   ;   /* ignore spaces */
.       { printf("UNKNOWN symbol\n"); }
%%

int main()
{
    printf("Enter input:\n");
    yylex();
    return 0;
}
