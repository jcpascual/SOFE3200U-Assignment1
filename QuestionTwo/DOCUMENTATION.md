# Question Two

This perl script checks if a name exists in a phone directory file.

## Usage

To check a name, run the script and enter a name.

```
$ ./phone.pl
Please enter a first name, last name, or part of a name: Julian
Possible match: Julian Pascual with number 111-222-3333
```

## Directory Format

The script expects a phone directory file in the following format:

```
Name,Number
```

## Theory of Operation

First, a blank hash is created. Then, the phone directory file is opened and it is read line by line. For each line, the string is split by a comma, and the entry is added to the hash.

Next, the script asks the user for a name and reads their input from ``stdin``. This name is compared to every key in the entries hash. If the key has a match, then it and the associated phone number is printed to ``stdout``. If no matches are found, then an error message printed.