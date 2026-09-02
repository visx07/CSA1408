%{
#include <stdio.h>

int keyword_count = 0;
int identifier_count = 0;

extern FILE *yyin;
%}

/* Macro Definitions */
KEYWORD auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
ID      [a-zA-Z_][a-zA-Z0-9_]*

%%

{KEYWORD} {
    keyword_count++;
    printf("[KEYWORD]   : %s\n", yytext);
}

{ID} {
    identifier_count++;
    printf("[IDENTIFIER]: %s\n", yytext);
}

[0-9]+(\.[0-9]+)? {
    /* Ignore numbers */
}

"//".* {
    /* Ignore single-line comments */
}

"/*"([^*]|\*+[^*/])*\*+"/" {
    /* Ignore multi-line comments */
}

[ \t\n]+ {
    /* Ignore whitespace */
}

. {
    /* Ignore all other characters */
}

%%

int yywrap(void)
{
    return 1;
}

int main(int argc, char *argv[])
{
    if (argc > 1)
    {
        FILE *f = fopen(argv[1], "r");

        if (f == NULL)
        {
            perror("Error opening file");
            return 1;
        }

        yyin = f;
    }

    printf("------ Token Separation Analysis ------\n\n");

    yylex();

    printf("\n------ Analysis Summary ------\n");
    printf("Total Keywords Found    : %d\n", keyword_count);
    printf("Total Identifiers Found : %d\n", identifier_count);

    return 0;
}