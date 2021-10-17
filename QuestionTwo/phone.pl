#!/usr/bin/perl

# Declare empty hash for phone directory
my %entries = ();

# Open the phone directory file, and die if failed
open(my $handle, '<', "phones") or die "Can't open phones file";
{
    # Loop over every line. Split it by a comma, then add it to the hash.
    while(<$handle>)
    {
        my $entry = $_;
        chomp($entry);

        my @splitString = split(/,/, $entry);
        my $name = $splitString[0];
        my $number = $splitString[1];

        $entries{$name} = $number;
    }   
}

# Read in a name or partial name.
print "Please enter a first name, last name, or part of a name: ";
my $input = <STDIN>;
chomp($input);

# Check if there's a match in the entries hash. If so, set hasMatch to 1.
my $hasMatch = 0;
foreach $name (keys %entries)
{
    if (index($name, $input) != -1)
    {
        $hasMatch = 1;
        print "Possible match: $name with number $entries{$name}\n";
    }
}

# If there are no matches, print an error message.
if ($hasMatch == 0)
{
    print "\"$input\" NOT found in the phone directory file!\n";
}
