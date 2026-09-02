%{
#include <stdio.h>
#include <string.h>

char oldword[100];
char newword[100];
%}

%%
[a-zA-Z]+ {
    if(strcmp(yytext, oldword) == 0)
        fprintf(yyout, "%s", newword);
    else
        fprintf(yyout, "%s", yytext);
}

.|\n {
    fprintf(yyout, "%s", yytext);
}

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter word to replace: ");
    scanf("%s", oldword);

    printf("Enter new word: ");
    scanf("%s", newword);

    yyin = fopen("Exp-39(input).txt", "r");
    yyout = fopen("output.txt", "w");

    if(yyin == NULL)
    {
        printf("Unable to open input.txt\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    printf("Word replaced successfully.\n");
    printf("Modified content is stored in output.txt\n");

    return 0;
}