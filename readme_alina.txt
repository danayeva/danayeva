**Here is the command that is written as solution:**


***
#! /bin/bash

total_bytes=$(cut -d ' ' -f10,12 $2 | sed "s/\"//" | sort | awk '{arr[$2]+=$1} END {for (i in arr) {print i,arr[i]}}'sort | uniq | sort -k 2 -n -r | head -$1 | awk '{sum_bytes+=$2} END {print sum_bytes}')

echo "$(cut -d ' ' -f10,12 $2 | sed "s/\"//" | sort | awk '{arr[$2]+=$1} END {for (i in arr) {print i,arr[i]}}'sort | uniq | sort -k 2 -n -r | head -$1 | \
         awk '{ printf(NR ". %s - %d - %.1f%%\n", $1, $2, $2 / '"$total_bytes"' * 100) }')"
***

**MEANING OF EACH COMMAND USED:**
cut -d ' ' -f10,12 $2 - takes the third and 6th field in array of data, which was splitted by " sign. $2 means 2nd parameter, in our case log.txt.
sed "s/\"//" - replaces all " signs to empty string.
sort - making sort by alphabet.
uniq - takes only uniq values from previous result.
sort -k 2 -n -r - making a sort a file with numeric data in reverse order using the combination of two options as -n (number) and -r (reverse). Used the -k option to sort on a certain column. For example, use “-k 2” to sort on the second column.
head -$1 - we have two options as tail and head, which gave us bottom and top values each. In this case we've used head to take top $1 (as input of 1st) values.
awk '{sum_bytes+=$2} END {print sum_bytes}' - also using awk we can calculate total numbers of bytes by adding them to each other one by one using such kind of loop.

echo "$(cut -d ' ' -f10,12... " - we output the data using the result of total number of bytes to represent the percents of each value by dividing occurence of each to total and then multiplying it to 100 %.
awk '{ printf(NR ". %s - %d - %.1f%%\n", $1, $2, $2 / '"$total_bytes"' * 100) }' - awk is special option that can work with output formatting also. %s is maximum number of characters from the string that should print, %d is the minimum number of digits to print, %.1f%% takes only 1 digit after point making output to look better.
***
