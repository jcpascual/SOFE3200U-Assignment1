#!/bin/bash

# Load file contents.
one=(`cat $1`)
two=(`cat $2`)

# These variables will be used later, so initialize them now.
similar_words=0
max_words=0

# Get the number of words in each file (length of arrays).
one_max=${#one[@]}
two_max=${#two[@]}

# Set the maximum number of words as the largest array length.
if [[ $one_max -gt $two_max ]]
then
    max_words=$one_max
else
    max_words=$two_max
fi

# Loop over every word in the one array. If there is no equivalent word (index) in the two
# array, stop the loop altogether. Otherwise, compare the word. If they are equal, then increment
# the similar words variable by 1.
for i in "${!one[@]}"
do
    if [[ $i -ge $two_max ]]
    then
        break
    fi

    if [[ ${one[$i]} == ${two[$i]} ]]
    then
        similar_words=$((similar_words + 1))
    fi
done

# Calculate the percentage of similar words.
result=`echo "bc_result = ($similar_words/$max_words)*100; scale=2; bc_result / 1" | bc -l`

echo "The similarity between the files is $result%."