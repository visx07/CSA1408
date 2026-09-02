%{
#include<stdio.h>
%}

%%
"abc"  {printf("ABC");}
.|\n   {printf("%s",yytext);}
%%

int main(){
	printf("Enter the input String:\n");
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}