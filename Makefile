all: clean build test
build:
	lex parser.l
	m4 parser.y.m4 > parser.y
	yacc -dv parser.y
	cc -o parser lex.yy.c y.tab.c
clean:
	rm -f lex.yy.c y.tab.c y.tab.h parser parser.y test-output.txt y.output
test:
	sh test.sh
