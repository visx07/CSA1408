%{
#include <stdio.h>
%}

KEYWORD    (int|float|char|double|void|if|else|for|while|do|return|switch|case|break|continue|struct|long|short|unsigned|signed)
IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*
NUMBER      [0-9]+
OPERATOR    (\+\+|--|==|!=|<=|>=|&&|\|\||\+=|-=|\*=|\/=|%=|[+\-*/%=<>!&|])
SPECIAL     [;,(){}\[\]]
STRING      \"([^\"\\]|\\.)*\"

%%

[ \t\n]+                ;

"//".*                  {
                            printf("COMMENT       : %s\n", yytext);
                        }

"/*"([^*]|\*+[^*/])*\*+"/" {
                            printf("COMMENT       : %s\n", yytext);
                        }

{KEYWORD}               {
                            printf("KEYWORD       : %s\n", yytext);
                        }

{IDENTIFIER}            {
                            printf("IDENTIFIER    : %s\n", yytext);
                        }

{NUMBER}                {
                            printf("CONSTANT      : %s\n", yytext);
                        }

{STRING}                {
                            printf("STRING        : %s\n", yytext);
                        }

{OPERATOR}              {
                            printf("OPERATOR      : %s\n", yytext);
                        }

{SPECIAL}               {
                            printf("SPECIAL SYMBOL: %s\n", yytext);
                        }

.                       {
                            printf("UNKNOWN       : %s\n", yytext);
                        }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("========================================\n");
    printf("       C PROGRAM TOKEN SEPARATOR\n");
    printf("========================================\n\n");

    yylex();

    return 0;
}