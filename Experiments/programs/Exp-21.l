%{
#include<stdio.h>
int v=0,c=0;
%}

%%
[\t\n]+ ;
[aeiouAEIOU] {v++;}
%%

int main()
{
	printf("Enter the input String :\n");
	yylex();
	printf("No of vowels are %d \n" , v);
}

int yywrap()
{ 
	return 1;
}