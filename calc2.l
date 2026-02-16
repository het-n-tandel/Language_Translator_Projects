%{
#include <stdio.h>
#include "calc2.tab.h"
extern int yylval;
%}

%%
[0-9]+  {
            yylval = atoi(yytext);
            return NUMBER;
        }
[ \t]   ; /* skip whitespace */
\n      return '\n';
.       return yytext[0];
%%

int yywrap() {
    return 1;
}
