all: clean build test
build:
	lex parser.l
	yacc -d parser.y
	cc -o parser lex.yy.c y.tab.c
clean:
	rm -f lex.yy.c y.tab.c y.tab.h parser test-output.txt
test:
	sh test.sh
