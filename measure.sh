#!/bin/bash
function ticker_wait {
    local MM=;
    read -u 4 MM
}


# Bashism
exec 4< <(./ticker.sh)

while true; do 
    COUNT=0
    printf -v NOW0 "%(%s)T" -1
    while true; do
        printf -v NOW1 "%(%s)T" -1
        ticker_wait;
        COUNT=$(($COUNT+1))
        if [[ $NOW1 != $NOW0 ]] ; then break; fi
    done
    echo $COUNT
done
