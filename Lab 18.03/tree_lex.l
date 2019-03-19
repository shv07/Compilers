%{
#include "tree_bison.tab.h"
#include <math.h>
#define YYSTYPE double
%}
number [0-9]+\.?|[0-9]*\.[0-9]+
leaf "Leaf"
node "Node"
%%
[ ] {}
{leaf} {return LEAF;}
{node} {return NODE;}
{number} {sscanf(yytext,"%lf",&yylval);return NUMBER;}
\n|.  {return yytext[0];}
%%

