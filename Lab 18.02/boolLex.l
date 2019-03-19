%{
#include "boolBison.tab.h"
#define YYSTYPE int
%}
bool [01]     
%%[ ] {}      //ignore extra space
{bool} {sscanf(yytext,"%d",&yylval);return BOOLEAN;}      // yyval stores value , BOOLEAN stores the id
\n|.  {return yytext[0];}				// in case of any other thing except bool return it as it is  //bool can take only 0,1 
%%

