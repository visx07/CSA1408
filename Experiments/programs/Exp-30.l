%{
#include<stdio.h>
int v=0,c=0;
%}

%%
[\t\n]+ ;
[^aeiouAEIOU] {c++;}
%%

int main()
{
	printf("Enter the input String :\n");
	yylex();
	printf("\nNo of Consonants are %d \n", c);
}

int yywrap()
{ 
	return 1;
}