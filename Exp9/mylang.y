%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token I LIKE ALL SUBJECTS OS SUBJECT AND ALSO PROGRAMMING

%%

S : SIMPLE
  | SIMPLE AND ALSO SIMPLE
  ;

SIMPLE : I LIKE OBJ
       ;

OBJ : ALL SUBJECTS
    | OS SUBJECT
    | PROGRAMMING
    ;

%%

void yyerror(const char *s) {
    printf("Invalid sentence \n");
}

int main() {
    printf("Enter sentence:\n");
    if (yyparse() == 0)
        printf("Valid sentence \n");
    return 0;
}