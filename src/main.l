
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

/*
%token '{' '}' ':' ',' '"' '[' ']' INT STR
*/

%}

%%

\{ {return '{'; }

\} {return '}'; }

\[ {return '['; }

\] {return ']'; }

[,] {return ','; }

[a-zA-Z]+ {return PALAVRA; }

[0-9]+ {return INT; }

[0-9]+[.][0-9]+ {return FLOAT; }

\" {return '"'; }

\: {return ':'; }

\"(\\.|[^"\\])*\"  {return STR; }


. ; 


[\n] ;


%%

int yywrap() {
  return 1;
}
