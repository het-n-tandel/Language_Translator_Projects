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

[ \t]+      { /* ignore whitespace */ }
\n          { return '\n'; }
.           { return yytext[0]; }
%%

int yywrap() {
  return 1;
}
