all: clean build test
build:
	lex parser.l
	m4 parser.y.m4 > parser.y
	yacc -dv parser.y
	cc -o parser lex.yy.c y.tab.c
clean:
	rm -f lex.yy.c y.tab.c y.tab.h y.output parser parser.y *.core
test: .IGNORE
	echo tot | ./parser
	echo le mis mut le vis | ./parser
	echo le mis mut le viss | ./parser
	echo le mis mut le vis le vis | ./parser
	echo le mis mut le qvis | ./parser
	echo le mis mut le visqvis | ./parser
	echo le vis bit et tot maet le mis mut le vis nul li tisi fili | ./parser
	echo le vis bit et tod maet le mis mut le vis nul li tisi fili | ./parser
	dd if=/dev/urandom bs=100 count=1 2>&- | ./parser
	echo le tis miwit | ./parser
	# expected 0
	echo le tis ducavesiwit | ./parser
	# expected 1234
	echo le tis dudududududududududududududududududududududuwit | ./parser
	# expected 1111111111111111111111
	echo le tis zuluwit | ./parser
	# expected -5
	echo le tis zubateriwit | ./parser
	# expected -678
	echo le tis fuhamiwit | ./parser
	# expected 9/0
	echo le tis ducavehabalusiwit | ./parser
	# expected 123/654
	echo le tis zutehariwit | ./parser
	# expected -7/8
	echo le tis zufucamihateteduwit | ./parser
	# expected -920/771
	echo le tis sipiluhabawit | ./parser
	# expected 4_5/6
	echo le tis cadumipiritebahalusivewit | ./parser
	# expected 210_876/543
	echo le tis zusipiluhabawit | ./parser
	# expected -4_5/6
	echo le tis zucadumipiritebahalusivewit | ./parser
	# expected -210_876/543
	echo le tis minaduxit | ./parser
	# expected 0.1
	echo le tis duvecanafuteluwit | ./parser
	# expected 132.975
	echo le tis zuminaduwit | ./parser
	# expected -0.1
	echo le tis zuduvecanafuteluwit | ./parser
	# expected -132.975
	echo le tis minadugevewit | ./parser
	# expected 0.1e3
	echo le tis duvecanafutelugelusivewit | ./parser
	# expected 132.975e543
	echo le tis minadugezuvewit | ./parser
	# expected 0.1e-3
	echo le tis duvecanafutelugezulusivewit | ./parser
	# expected 132.975e-543
	echo le tis zuminadugevewit | ./parser
	# expected -0.1e3
	echo le tis zuduvecanafutelugelusivewit | ./parser
	# expected -132.975e543
	echo le tis zuminadugezuvewit | ./parser
	# expected -0.1e-3
	echo le tis zuduvecanafutelugezulusivewit | ./parser
	# expected -132.975e-543
	echo le tis lugefuwit | ./parser
	# expected 5e9
	echo le tis lulululugefufufufuwit | ./parser
	# expected 5555e9999
	echo le tis zulugefuwit | ./parser
	# expected -5e9
	echo le tis zululululugefufufufuwit | ./parser
	# expected -5555e9999
	echo le tis lugezufuwit | ./parser
	# expected 5e-9
	echo le tis lulululugezufufufufuwit | ./parser
	# expected 5555e-9999
	echo le tis zulugezufuwit | ./parser
	# expected -5e-9
	echo le tis zululululugezufufufufuwit | ./parser
	# expected -5555e-9999
