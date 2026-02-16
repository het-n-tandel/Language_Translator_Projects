%{
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

input:
      | input line
      ;

line:
      '\n'
    | expr '\n'   { printf("Result = %d\n", $1); }
    ;

expr:
      expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | '(' expr ')'  { $$ = $2; }
    | NUMBER        { $$ = $1; }
    ;

%%

int yylex(void) {
    int c;

    while ((c = getchar()) == ' ' || c == '\t');

    if (isdigit(c)) {
        ungetc(c, stdin);
        scanf("%d", &yylval);
        return NUMBER;
    }

    return c;
}

int yyerror(const char *s) {
    printf("Syntax Error\n");
    return 0;
}

int main(void) {
    printf("Enter expression:\n");
    yyparse();
    return 0;
}
