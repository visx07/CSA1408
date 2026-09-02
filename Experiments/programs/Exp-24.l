%{
#include <stdio.h>

int comment_count = 0;
%}

%%

"//".* {
    comment_count++;
}

"/*"([^*]|\*+[^*/])*\*+"/" {
    comment_count++;
}

\n {
    fprintf(yyout, "\n");
}

. {
    fprintf(yyout, "%s", yytext);
}

%%

int yywrap()
{
    return 1;
}

int main()
{
    FILE *input_file;
    FILE *output_file;

    input_file = fopen("Exp-24(input).txt", "r");

    if (input_file == NULL)
    {
        printf("Unable to open input.c\n");
        return 1;
    }

    output_file = fopen("output.c", "w");

    if (output_file == NULL)
    {
        printf("Unable to create output.ct\n");
        fclose(input_file);
        return 1;
    }

    yyin = input_file;
    yyout = output_file;

    yylex();

    fclose(input_file);
    fclose(output_file);

    printf("Number of comments = %d\n", comment_count);
    printf("Comments eliminated successfully.\n");
    printf("Comment-free program is stored in output.c\n");

    return 0;
}