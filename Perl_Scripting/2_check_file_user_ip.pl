# Write a Perl script to get the file name as user input.
# Check whether the file exists or not.  
# If the file exists then check whether the file is empty or not.

#!usr/bin/perl

print "Enter File Name : ";
$filename=<STDIN>;
chomp $filename;

if(-e $filename)
{
  print "$filename exists\n";
  if(-z $filename)
  {
	print "$filename is empty\n";
  }
  else
  {
	print "$filename is not empty\n";
  }
}
else
{
  print "$filename does not exist\n";
}