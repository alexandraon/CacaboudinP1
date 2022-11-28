#!/usr/bin/bash
echo "nThreads,run 1,run 2,run 3,run 4,run 5" > file_cons.csv;
for n_threads in 1 2 4 8 16
do 
    echo -n "$n_threads">> file_cons.csv
    for n_essai in 1 2 3 4 5
    do         
        time=$(/usr/bin/time -f "%e" ./conso_prod $n_threads $n_threads 2>&1|tail -n 1)
        echo -n ",$time" >> file_cons.csv
    done
    echo "">> file_cons.csv
done
