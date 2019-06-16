#!/bin/sh

for i in test-*-i.txt; do
    j="${i%-i.txt}"
    k="${j#test-}"
    ./parser < "test-$k-i.txt" > "test-$k-o.txt"
    och=$(openssl dgst "test-$k-o.txt" | cut -d '=' -f 2)
    ech=$(openssl dgst "test-$k-e.txt" | cut -d '=' -f 2)
    if [ "X$och" = "X$ech" ]; then
        echo "test $k ok"
    else
        echo "test $k fail"
    fi
done
