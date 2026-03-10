%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *s);
%}

%union {
  char *str;
}

%token SAB DATA CHAIYE SEY KE SIRF AUR KAA COMMA DOT
%token <str> STR

%%

queries: queries query
       | query
       ;

query: SAB DATA CHAIYE STR SEY DOT 
       { 
         printf("select * from %s;\n", $4); 
         free($4);
       }
     | STR KE SAB DATA DOT 
       { 
         printf("select * from %s;\n", $1); 
         free($1);
       }
     | SIRF STR CHAIYE COMMA STR SEY DOT 
       { 
         printf("select * from %s with column='%s';\n", $5, $2); 
         free($2);
         free($5);
       }
     | STR AUR STR KAA SAB DATA CHAIYE DOT 
       { 
         printf("select * from %s, %s;\n", $1, $3); 
         free($1);
         free($3);
       }
     ;

%%

void yyerror(const char *s) {
  fprintf(stderr, "Error: %s\n", s);
}

int main() {
  printf("Enter sentences (Ctrl+D to exit):\n");
  yyparse();
  return 0;
}
