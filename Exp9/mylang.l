%{
#include "mylang.tab.h"
%}

%%

[Ii]            return I;          /* accept I or i */
"like"          return LIKE;
"all"           return ALL;
"subjects"      return SUBJECTS;
"OS"            return OS;
"subject"       return SUBJECT;
"and"           return AND;
"also"          return ALSO;
"programming"   return PROGRAMMING;

"."             ;        /* ignore dot */
\n              return 0; /* end input */

[ \t]           ;        /* ignore spaces */

.               return yytext[0];

%%

int yywrap() {
    return 1;
}