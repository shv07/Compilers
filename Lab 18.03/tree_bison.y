%{
#include<stdio.h>
  #include<ctype.h>

   int yylex (void);
  void yyerror (char  *);
   %}
%define api.value.type {double}
%token NUMBER
%token LEAF
%token NODE
%%

S : S '\n' Tree '\n' {printf("%g\n",$2);}
|
;
Tree : 'e' {$$ = 0;}
| LEAF NUMBER  {$$ = $2;}
| NODE NUMBER '(' Tree ')' '(' Tree ')'  {$$ = $2+$4+$7;}
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

