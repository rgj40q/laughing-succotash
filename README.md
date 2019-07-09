Requires a POSIX environment to build (e.g. Cygwin on Windows), specifically there should be utilities: cc, lex (or flex), yacc (or bison), and sh. Tested with gcc v4.2.1 and v8.3.0 and clang v7.0.1.

To build, type in the shell in the source code directory:

    make build

Usage:

    echo some text to be parsed | ./parser

or:

    ./parser < imput.txt > output.txt
