# laughing-succotash
parser for artificial language

To compile type in the shell in the source code directory:

    make build

Requires a posix environment to build, specifically there should be cc, lex, m4, yacc, and sh utilities.

Usage:

    echo some text to be parsed | ./parser
or:

    ./parser < imput.txt > output.txt
