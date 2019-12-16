letter [A-Za-z]
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
int line=1;
%}
%%
[A-Z]{letter}* yylval.string=strdup(yytext); return NONTERMINAL;
[a-z]{letter}* yylval.string=strdup(yytext); return TERMINAL;
\< return LESS;
\- return MINUS;
\> return GREATER;
\n line++;return ENDL;
[ \t]+
%%