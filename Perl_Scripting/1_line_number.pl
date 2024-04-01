# Write a Perl script using file handling
# Get the file name from the user
# Open the file, if unsuccessful, print error message and exit
# Add line numbers to the content.
# Print the total number of lines in the file

#!usr/bin/perl

print "Enter File Name : ";
$filename=<STDIN>;
chomp $filename;

open(fh, '<', $filename) or die "Failed to open $filename";

$line_number=0;
while(<fh>)
{
	print "$. $_";
	$line_number++;
}

print "Total Number of Lines = $line_number\n";
close(fh);