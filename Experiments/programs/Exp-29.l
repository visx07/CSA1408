
%{
#include <stdio.h>
%}

%%

"#include"                    { printf("PREPROCESSOR     : %s\n", yytext); }

"int"|"float"|"char"|"double"|"void"|"if"|"else"|"for"|"while"|"return"  { printf("KEYWORD          : %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*        { printf("IDENTIFIER       : %s\n", yytext); }

[0-9]+                         { printf("CONSTANT         : %s\n", yytext); }

\"([^\"\\]|\\.)*\"             { printf("STRING           : %s\n", yytext); }

"=="|"!="|"<="|">="|"++"|"--"|"+"|"-"|"*"|"/"|"="|"<"|">"  { printf("OPERATOR         : %s\n", yytext); }

[;,(){}\[\]<>.]               { printf("SPECIAL SYMBOL   : %s\n", yytext); }

[ \t\n]+                       ;

.                              { printf("UNKNOWN          : %s\n", yytext); }

%%

int yywrap()
{
    return 1;
}

int main()
{
    FILE *fp;

    fp = fopen("Exp-29(input).txt","r");

    if (fp == NULL)
    {
        printf("Unable to open sample.c\n");
        return 1;
    }

    yyin = fp;

    printf("============================================\n");
    printf("          LEXICAL ANALYZER\n");
    printf("============================================\n\n");

    yylex();

    fclose(fp);

    return 0;
}

