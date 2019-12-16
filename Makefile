all: yacc lex
	cc lex.yy.c y.tab.c -o term

yacc: term.y
	yacc -d term.y

lex: term.l
	lex term.l