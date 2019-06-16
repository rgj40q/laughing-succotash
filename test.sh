#!/bin/sh

cd tests
for k in *-i.txt; do
    i="${k%-i.txt}"
    ../parser < $i-i.txt > $i-o.txt
    ocs=$(openssl dgst "$i-o.txt" | cut -d '=' -f 2)
    ecs=$(openssl dgst "$i-e.txt" | cut -d '=' -f 2)
    if [ "X$ocs" = "X$ecs" ]; then
        echo "test $i ok"
    else
        echo "test $i fail"
    fi
done
