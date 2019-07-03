#!/bin/sh

./parser < test-input.txt > test-output.txt || {
    echo 'test fail'
    exit
}
och=$(openssl dgst test-output.txt | cut -d '=' -f 2)
ech=$(openssl dgst test-expected.txt | cut -d '=' -f 2)
if [ "$och" = "$ech" ]; then
    echo 'test ok'
else
    echo 'test fail'
fi