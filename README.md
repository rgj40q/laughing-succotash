Requires a POSIX environment to build (e.g. Cygwin on Windows), specifically there should be utilities: cc, lex (or flex), yacc (or bison), and sh.

To build, type in the shell in the source code directory:

    make build

Usage:

    echo some text to be parsed | ./parser

or:

    ./parser < imput.txt > output.txt
