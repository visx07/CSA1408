%{
#include <stdio.h>

int characters = 0;
int lines = 0;
int words = 0;
%}

%%

"//".*                  ;          /* Ignore single-line comments */

"/*"([^*]|\*+[^*/])*\*+"/"   ;    /* Ignore multi-line comments */

[ \t]+                  ;          /* Ignore spaces and tabs */

\n                      { lines++; }

\"([^\\\"]|\\.)*\"      { characters += yyleng; words++; }

[A-Za-z_][A-Za-z0-9_]*  { characters += yyleng; words++; }

[0-9]+                  { characters += yyleng; words++; }

.                       { characters++; }

%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("Exp-19(input).txt", "r");

    if (yyin == NULL)
    {
        printf("Cannot open sample.c\n");
        return 1;
    }

    yylex();

    fclose(yyin);

    printf("Number of characters = %d\n", characters);
    printf("Number of lines = %d\n", lines);
    printf("Number of words = %d\n", words);

    return 0;
}