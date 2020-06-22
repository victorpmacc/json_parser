

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' ':' ',' '"' '[' ']' INT STR FLOAT PALAVRA

%%
S:
 J {printf("VALIDO\n");}
 ;
 
J:
 '{' C '}' {}
 ;
 
C:
 E {}
 |
 ;

E:
 STR ':' A {}
 | E ',' E {}
 ;

A:
 INT {}
 | FLOAT {}
 | STR {}
 | PALAVRA {}
 | L {}
 | J {}
 ;
 
L:
 '[' CL ']' {}
 ;

CL:
 AL {}
 |
 ;
 
AL:
 INT{}
 | STR{}
 | L {}
 | AL ',' AL {}
 ;


%%

void yyerror(char *s) {
 printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
