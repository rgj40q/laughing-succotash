all: clean build test
build:
	lex parser.l
	m4 parser.y.m4 > parser.y
	yacc -d parser.y
	cc -o parser lex.yy.c y.tab.c
clean:
	rm -f lex.yy.c y.tab.c y.tab.h y.output parser parser.y *.core
test: .IGNORE
	echo tot | ./parser
	echo ius mit tus | ./parser
	echo ius mit tus | ./parser
	echo ius mit tuss | ./parser
	echo ius mit tus tus | ./parser
	echo ius mit tusu | ./parser
	echo ius mit tusi | ./parser
	echo ius mit le visqus | ./parser
	echo ius mit un visqus | ./parser
	echo ius mit visqus | ./parser
	echo tus but et tot maet ius mit tus nil le cusu fulu | ./parser
	echo tus but et tod maet ius mit tus nil le cusu fulu | ./parser
	dd if=/dev/urandom bs=100 count=1 2>&- | ./parser
	echo onus miwut | ./parser
	# expected 0
	echo onus ducavesiwut | ./parser
	# expected 1234
	echo onus dudududududududududududududududududududududuwut | ./parser
	# expected 1111111111111111111111
	echo onus zuluwut | ./parser
	# expected -5
	echo onus zubateriwut | ./parser
	# expected -678
	echo onus fuhamiwut | ./parser
	# expected 9/0
	echo onus ducavehabalusiwut | ./parser
	# expected 123/654
	echo onus zutehariwut | ./parser
	# expected -7/8
	echo onus zufucamihateteduwut | ./parser
	# expected -920/771
	echo onus sipiluhabawut | ./parser
	# expected 4_5/6
	echo onus cadumipiritebahalusivewut | ./parser
	# expected 210_876/543
	echo onus zusipiluhabawut | ./parser
	# expected -4_5/6
	echo onus zucadumipiritebahalusivewut | ./parser
	# expected -210_876/543
	echo onus minaduwut | ./parser
	# expected 0.1
	echo onus duvecanafuteluwut | ./parser
	# expected 132.975
	echo onus zuminaduwut | ./parser
	# expected -0.1
	echo onus zuduvecanafuteluwut | ./parser
	# expected -132.975
	echo onus minadugevewut | ./parser
	# expected 0.1e3
	echo onus duvecanafutelugelusivewut | ./parser
	# expected 132.975e543
	echo onus minadugezuvewut | ./parser
	# expected 0.1e-3
	echo onus duvecanafutelugezulusivewut | ./parser
	# expected 132.975e-543
	echo onus zuminadugevewut | ./parser
	# expected -0.1e3
	echo onus zuduvecanafutelugelusivewut | ./parser
	# expected -132.975e543
	echo onus zuminadugezuvewut | ./parser
	# expected -0.1e-3
	echo onus zuduvecanafutelugezulusivewut | ./parser
	# expected -132.975e-543
	echo onus lugefuwut | ./parser
	# expected 5e9
	echo onus lulululugefufufufuwut | ./parser
	# expected 5555e9999
	echo onus zulugefuwut | ./parser
	# expected -5e9
	echo onus zululululugefufufufuwut | ./parser
	# expected -5555e9999
	echo onus lugezufuwut | ./parser
	# expected 5e-9
	echo onus lulululugezufufufufuwut | ./parser
	# expected 5555e-9999
	echo onus zulugezufuwut | ./parser
	# expected -5e-9
	echo onus zululululugezufufufufuwut | ./parser
	# expected -5555e-9999
