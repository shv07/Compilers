%{
#include<stdio.h>
  #include<ctype.h>

   int yylex (void);
  void yyerror (char  *);
   %}
%define api.value.type {int}
%token BOOLEAN
%left '+'
%left '*'
%right '!'
%%

//defining the grammar

line :line bexpr '\n' {printf("%d\n",$2);}     //for giving multiple lines
     |
     ;

bexpr : bexpr '+' bterm {$$=$1 || $3;}
     | bterm {$$=$1;}
     ;
bterm : bterm '*' bfactor {$$=$1 && $3;}
| bfactor 
     ;
bfactor : '!' bfactor  {$$=!$2;}
       | '(' bexpr ')' {$$=$2;}
	|BOOLEAN
       ;

%%

int main (void)
{
  return yyparse ();
}



/* Called by yyparse on error.  */
void yyerror (char  *s)
{
  printf ("%s\n", s);
}

