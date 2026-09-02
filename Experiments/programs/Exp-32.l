%{
#include <stdio.h>
int pos=0;
int neg=0;
%}

%%
[-][0-9]+(\.[0-9]+)?	{neg++; printf("(Negative: %s)\n",yytext);}
[+]?[0-9]+(\.[0-9]+)?	{pos++; printf("(Positive: %s)\n",yytext);}
.|\n			{ /* Ignore all the other characters like spaces, letter,etc.*/}
%%

int main(){
	printf("Enter numbers separated by space / newlines:\n");
	printf("Press Ctrl+D when you are finished entering input. \n\n");
	yylex();
	printf("\n----- Final Counts -----\n");
	printf("Total Positive Numbers : %d\n",pos);
	printf("Total Negative Numbers : %d\n",neg);
	return 0;
}

int yywrap(){
	return 1;
}