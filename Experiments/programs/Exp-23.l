%{
#include <stdio.h>

int line_no = 1;
%}

%%

\n {
    printf("\n%4d  ", ++line_no);
}

. {
    printf("%s", yytext);
}

%%

int yywrap()
{
    return 1;
}

int main()
{
    FILE *fp;

    fp = fopen("Exp-23(input).txt", "r");

    if (fp == NULL)
    {
        printf("Unable to open Exp-23(input).txt\n");
        return 1;
    }

    yyin = fp;

    printf("LINE NUMBERED C PROGRAM\n");
    printf("=======================\n\n");

    printf("%4d  ", line_no);

    yylex();

    fclose(fp);

    return 0;
}