# Question One

This bash script calculates a similarity percentage between two text files.

## Usage

To check two files named ``SampleA.txt`` and ``SampleB.txt``:

```
$ ./QuestionOne.sh SampleA.txt SampleB.txt
The similarity between the files is 73.07%.
```

## Theory of Operation

First, the files are read in and the string contents are stored in a variable. Then, the contents are converted into an array by splitting the strings with whitespace characters as delimiters.

The algorithm used to check for similarity is to compare each word of the file in order by looping over the arrays, like so:

|File A|File B|Match?|
|------|------|------|
|this  |this  |Yes   |
|is    |is    |Yes   |
|a     |a     |Yes   |
|test  |sample|No    |

For each matching word, a variable is incremented by 1. If the array lengths are different, the matching continues until the end of the shorter array.

To calcluate the similarity percentage, the number of matching words is divided by the length of the largest array and multiplied by 100. The calculation is performed using the ``bc`` command.

To get two decimal places with ``bc``, the calculation is stored in a temporary variable with 20 decimal places, the scale is then set to 2 places, and the temporary variable is divided by 1 as the final operation to ensure that it is printed with the scale of 2. If the scale is set to 2 at the beginning, the decimal portion will always be zero.

Finally, the similarity percentage is formatted into a string and printed to ``stdout``.