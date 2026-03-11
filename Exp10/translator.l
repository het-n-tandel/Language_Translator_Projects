%{
#include "translator.tab.h"
#include <string.h>
%}

%%
"sab"       { return SAB; }
"data"      { return DATA; }
"chaiye"    { return CHAIYE; }
"sey"       { return SEY; }
"ke"        { return KE; }
"sirf"      { return SIRF; }
"aur"       { return AUR; }
"kaa"       { return KAA; }
","         { return COMMA; }
"."         { return DOT; }

\'[^\']+\'  { 
              yytext[yyleng-1] = '\0';
              char *val = yytext + 1;
              yylval.str = strdup(val);
              return STR; 
            }

[ \t\n]+    { /* ignore whitespace */ }
.           { printf("Unknown character: %s\n", yytext); }
%%

int yywrap() {
  return 1;
}
