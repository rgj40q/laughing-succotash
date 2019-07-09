all: clean build test
build:
	flex parser.l
	bison -y -d parser.y
	gcc -o parser lex.yy.c y.tab.c
buildbsd:
	lex parser.l
	yacc -d parser.y
	cc -o parser lex.yy.c y.tab.c
clean:
	rm -f lex.yy.c y.tab.c y.tab.h parser test-output.txt
test:
	sh test.sh
