%{
#include <stdio.h>
#include <string.h>

char word[100];
int count = 0;
%}

%%
[a-zA-Z]+ {
    if(strcmp(yytext, word) == 0)
        count++;
}

\n {
    printf("Frequency of \"%s\" = %d\n", word, count);
    return 0;
}

. ;
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter word to search: ");
    scanf("%s", word);

    getchar();

    printf("Enter sentence: ");
    yylex();

    return 0;
}