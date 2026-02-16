%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
input:
      | input line
      ;

line: '\n'
    | expr '\n'   { printf("Result = %d\n", $1); }
    ;

expr: expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { $$ = $1 / $3; }
    | '(' expr ')'    { $$ = $2; }
    | NUMBER          { $$ = $1; }
    ;
%%

int main() {
    printf("Enter expressions:\n");
    return yyparse();
}

int yyerror(char *s) {
    printf("Invalid Expression\n");
    return 0;
}
