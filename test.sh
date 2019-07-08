#!/bin/sh

./parser < 'test-input.txt' > 'test-output.txt' || {
    echo 'test fail'
    exit
}
if [ -z "$(diff test-output.txt test-expected.txt)" ]; then
    echo 'test ok'
else
    echo 'test fail'
fi
