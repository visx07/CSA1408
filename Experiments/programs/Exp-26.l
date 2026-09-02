%{
#include <stdio.h>
int set=0;
%}

%%
[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3} {set=1;}
.|\n
%%

int main()
{
	printf("Enter an email address : ");
	yylex();
	if (set==1){
            printf("\nAccepted : This is a valid email Id. \n");
	}else{
	    printf("\nNot Accepted: This is not a valid email Id. \n");
	}
	return 0;
}

int yywrap(){
	return 1;
}