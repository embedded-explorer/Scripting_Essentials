Rename all .html to .hldd 
################################################################### 
# Script to rename all .html files to .hldd 
################################################################### 
#!/usr/bin/bash 
for file in *.html; do 
mv "$file" "${file%.html}.hldd" 
done 

Copy the contents commands.txt to unit4 and unit5 (using relative path)  
################################################################### 
# Script to copy file to multiple locations 
################################################################### 
#!/usr/bin/bash 
destination=("../../Unit4" "../../Unit5") 
for dest in ${destination[@]}; do 
cp Commands.txt "$dest" 
done

a. Print all the lines with the pattern “they”  
grep "they" poem.txt 
b. Print all the lines with the pattern “heights” or “flight”  
grep -e "heights" -e "flight" poem.txt 
egrep "heights|flight" poem.txt 
grep -E "heights|flight" poem.txt 
c. Print all the lines which have both “heights” and “great”  
grep "heights" poem.txt | grep "great" 
d. Print all the lines other than pattern “They” 
grep -v "They" poem.txt 
e. Print all the lines with the pattern “they” or “They”  
egrep "they|They" poem.txt 
f. Print all the matched lines with line number  
egrep -n "they|They" poem.txt 
g. Print all the lines end with “,”  
grep -n ",$" poem.txt 
h. Print all the lines starts with “w” 
grep -n -i "^w" poem.txt 
i. Count the number of line starts with “w” 
grep -i "^w" poem.txt |wc 
j. Count the number of empty lines 
grep -i -c "^$" poem.txt 
k. Print the next lines after the pattern “stone” matches  
Hint: man grep 
grep -A 1 "stone" poem.txt 
l. Print the 2 lines above the pattern “stone” matches  
Hint: man grep 
grep -B 2 "stone" poem.txt 
m. Store the patterns in file and search the pattern. 
stones 
they 
heights 
grep -f pattern.txt poem.txt 
n. Search the pattern recursively from the directory  
Try option  -d , -r , -R  
grep -r -f pattern.txt ./ 
o. Search the pattern with exact match. 
grep -w "we" poem.txt 

5. Write a shell script to get the pattern and filenames from the user and check whether the pattern is present or not. 
# Take pattern and file from user and search for pattern in file 
#!/usr/bin/bash 
read -p "Enter the file name: " fname 
read -p "Enter the pattern: " pattern 
grep -q $pattern $fname 
if test $? -eq 0 
then 
echo "pattern found" 
else 
echo "pattern not found" 
fi 

6. Rewrite the above shell script using command line arguments. (pass the pattern and file through command line arguments)  
# Take pattern and file from user and search for pattern in file 
#!/usr/bin/bash 
grep -q $1 $2 
if test $? -eq 0 
then 
echo "pattern found" 
else 
echo "pattern not found" 
fi 

7. Rewrite the above code to check whether the user enter valid number of arguments. 
# Take pattern and file from user and search for pattern in file 
#!/usr/bin/bash 
if test $# -ne 2 
then 
echo "Please Enter 2 Prameters" 
exit 1 
fi 
grep -q $1 $2 
if test $? -eq 0 
then 
echo "pattern found" 
else 
echo "pattern not found" 
fi 

a. Add a user name (create your own username) using the “useradd” command. 
sudo useradd -m -s /bin/bash user_1 
b. Create a password for the new user using the “passwd” command passwd. 
sudo passwd user_1 
c. Repeat step a) to b) to create 2 or 3 other users. (Create your friends name) 
sudo useradd -m -s /bin/bash user_2 
sudo passwd user_2 
sudo useradd -m -s /bin/bash user_3 
sudo passwd user_3 
d. Login using the new account. 
su user_1 
e. Examine the home directory of each user under /home/. 
ls
f. 
Examine the following files and see what’s added for the users/groups you created. Try to understand the new additions. 
i. 
/etc/passwd 
sudo cat /etc/passwd | grep -e "user_1" -e "user_2" -e "user_3" 
ii. 
/etc/shadow 
sudo cat /etc/passwd | grep -e "user_1" -e "user_2" -e "user_3" 
iii. 
/etc/group 
sudo cat /etc/passwd | grep -e "user_1" -e "user_2" -e "user_3"
g. Create two groups:  team, teacher. 
sudo groupadd team 
sudo groupadd teacher 
h.  Add (ur account) to the “team” group; add other users you have created to the “teacher” group. 
sudo usermod -aG team user_1 
sudo usermod -aG teacher user_2 
sudo usermod -aG teacher user_3 

8. Create two files: hard_link.txt and soft_link.txt. Create hard and soft link for these files 
according to file names. Check the results with ls -l command. What does the output of 
the command tell about the links and how do links differ? Remove the files you created 
and recheck the results with ls -l command. What differences do you notice? Hint:ln  
(Note: similar to creating short cut files in windows) 
touch hard_link.txt soft_link.txt 
ln hard_link.txt hard_link_copy.txt 
ln -s soft_link.txt soft_link_copy.txt 
ls -l 
rm hard_link.txt soft_link.txt 
ls -l 

13.  display 5 largest files in the working directory. Note: Make sure you have more than 5 
files.  
ls -l -S -a | head -n 6 

23. Perform arithmetic operations using bash scripting (Any example you can take – sum 
of numbers, adding palindrome numbers ….) 
# Script to take numbers from user and return their sum 
#!/usr/bin/bash 
echo "Enter numbers separated by spaces and press enter when done" 
read -a array 
sum=0 
for num in "${array[@]}"; do 
((sum+=num)) 
done 
echo "Sum of Numbers = $sum" 

4. Write a shell script. - - - - 
to get the file name and the pattern through command line arguments  
count number of occurrences  
count total number of lines 
print the usage – instructions if user is not passing the proper arguments. -w match whole words -c print only count of selected lines 
wc command prints number of lines words and characters -l option prints only lines 
# Take pattern and file from user and search for pattern in file 
#!/usr/bin/bash 
if test $# -ne 2 
then 
echo "Usage : $0 <Pattern> <File Name>" 
exit 1 
fi 
echo "Occurnces" 
grep -wc $1 $2 
echo "Lines" 
wc -l $2

25. Write a simple script that will check if exactly two arguments are passed. If so, print 
the arguments in reverse order. Consider this example. 
#!/usr/bin/bash 
if test $# -ne 2 
then 
echo "Usage : $0 <Pattern> <File Name>" 
exit 1 
fi 
echo $2 
echo $1 

26. write a bash script that accepts a command line argument. If an argument is passed, 
check if that argument matches the name of the current directory. If so, print yes. 
Otherwise, print no. If improper arguments are passed, provide correct usage of the 
script.  
# Check if current directory is same as input 
#!/usr/bin/bash 
if test $# -ne 1 
then 
echo "Usage : $0 <Directory Name>" 
exit 1 
fi 
curr_dir=$(basename $(pwd)) 
if [ "$1" = "$curr_dir" ] 
then 
echo "YES" 
else 
echo "NO" 
fi 

27. Write a shell script to greet the user based on their state.  
Note: get the username and their state details from the user 
# Greet user based on state 
#!/usr/bin/bash 
read -p "Enter User Name : " name 
read -p "Enter Your State : " state 
case $state in 
Karnataka) 
echo "Namaste $name" 
;; 
Tamilnadu) 
echo "Vanakkam $name" 
;; 
Andhrapradesh|Telangana) 
echo "Namaskaram $name" 
;; 
*) 
echo "Ram Ram $name" 
esac 

28. Rewrite the previous script using command line arguments. 
# Greet user based on state 
#!/usr/bin/bash 
if test $# -ne 2 
then 
echo "Usage : $0 <Name> <State>" 
exit 1 
fi 
case $2 in 
Karnataka) 
echo "Namaste $1" 
;; 
Tamilnadu) 
echo "Vanakkam $1" 
;; 
Andhrapradesh|Telangana) 
echo "Namaskaram $1" 
;; 
*) 
echo "Ram Ram $1" 
esac

29. Print all the lines having the word "pattern". 
grep "pattern" file.txt 
30. Pick out the blank lines in the file. 
grep "^$" file.txt 
31. Count total number of empty lines in the file. 
grep -c "^$" file.txt 
32. Print the line which have both “Sir and Madam”. 
grep -E -i "sir.*madam|madam.*sir" file.txt 
33. pick out lines with “pattern1” “pattern2” or “pattern3”. (use the alternator |) 
grep -E "pattern1|pattern2|pattern3" file.txt 
grep -e "pattern1" -e "pattern2" -e "pattern3" file.txt 
34. pick out lines that have at least two p's followed by any number of letters followed by 
'ore'. The p's do not have to be next to each other. 
grep -E "p.*p.*ore" file.txt 
35. pick out all the lines with v, z or I in them. 
grep "[vzI]" file.txt 
36. pick out all the lines that do not start with an uppercase letter. 
grep -v "^[A-Z]" file.txt 
37. pick out all the lines that end with a dash – 
grep -- "-$" file.txt 
grep -E ".*-$" file.txt 
38. pick out all the words that end with ore. 
grep -E -oi "[a-z]*ore$" file.txt 
39.  pick out all the words that start with f or F. 
grep -Eo "^f\w*|^F\w*" file.txt 
40.  pick out lines that uses first letter alliteration - starting two words with the same 
letter. 
grep -E "(\b\w)\w*\s+\1\w*" file.txt 
\b matches word boundary 
\w matches word character any alphanumeric character 
(\b\w) matches first letter of first word. 
(\w*) matches letters followed by first letter of first word. 
\s+ matches blank spaces. 
\1 First letter of second letter matches captured first letter. 
41. determine how many times contains the word "pattern". 
grep -o "pattern" file.txt | wc -l 
42. to pick out lines with at least 40 characters: 
grep -E ".{40,}" file.txt 
43. to pick out lines with no punctuation 
grep -Ev "[[:punct:]]" file.txt 
44.  to pick out lines with an uppercase letter other than the first character. (The first 
character on the line does not count.) 
grep -E "^[A-Z].*" file.txt 
45.  To pick out lines without rav. 
grep -v "rav" file.txt 
46. Write a shell script to generate a report with the following details.  - - - - 
Number of regular files  
Number of links  
Number of directories  
Print the date when it was processed!  
# This is shell script to generate report of existing files 
#!/usr/bin/bash 
regular_files=$(find ./ -type f | wc -l) 
links=$(find ./ -type l | wc -l) 
directories=$(find ./ -type d | wc -l) 
echo "Number of Regular Files : $regular_files" 
echo "Number of Links : $links" 
echo "Number of Directories : $directories" 
echo "Date : " `date` 
47. List the contents of your current directory, including the ownership and permissions, 
and store the output to a file called contents.txt within your home directory. 
ls -l > ~/contents.txt 
48. Sort the contents of the contents.txt file from your current directory and append it to 
the end of a new file named contents-sorted.txt. 
sort ~/contents.txt >> ~/contents-sorted.txt 
49. Display the last 10 lines of the /etc/passwd file and redirect it to a new file into user’s 
Documents directory. 
tail -n 10 /etc/passwd > ~/Documents/last_10_lines_passwd.txt 
50. Count the number of words within the contents.txt file and append the output to the 
end of a file field2.txt in your home directory. You will need to use both input and 
output redirection. 
wc -w < ~/contents.txt >> ~/field2.txt 
51. Display the first 5 lines of the /etc/passwd file and sort the output reverse 
alphabetically. 
head -n 5 /etc/passwd | sort -r 
52. Using the previously created contents.txt file, count the number of characters of the 
last 9 lines. 
tail -n 9 ~/contents.txt | wc -c 

1. Perform arithmetic operations using bash scripting (Any example you can take – sum 
of numbers, adding palindrome numbers ….) 
# Script to take numbers from user and return their sum 
#!/usr/bin/bash 
echo "Enter numbers separated by spaces and press enter when done" 
read -a array 
sum=0 
for num in "${array[@]}"; do 
((sum+=num)) 
done 
echo "Sum of Numbers = $sum" 

1. Write a simple script that will check if exactly two arguments are passed. If so, print 
the arguments in reverse order. 
#!/usr/bin/bash 
if test $# -ne 2 
then 
echo "Usage : $0 <Pattern> <File Name>" 
exit 1 
fi 
echo $2 
echo $1 

2. write a short script that accepts an argument. If an argument is passed, check if that 
argument matches the name of the current directory. If so, print yes. Otherwise, print 
no. 
# Check if current directory is same as input 
#!/usr/bin/bash 
if test $# -ne 1 
then 
echo "Usage : $0 <Directory Name>" 
exit 1 
fi 
curr_dir=$(basename $(pwd)) 
if [ "$1" = "$curr_dir" ] 
then 
echo "YES" 
else 
echo "NO" 
fi 

1. Write text into file overwrite if file already exists. 
echo "Hello World!" > file.txt 
2. Write text into file append if file already exists. 
echo "Appending to existing file" >> file.txt 
3. Read from file. 
echo $(<file.txt)
4. Write text into file overwrite if file already exists. 
cat > file_1.txt 
5. Write text into file append if file already exists. 
cat >> file_1.txt 
6. Display the contents of file. 
cat file_1.txt 
7. Display the contents of file along with line number. 
cat -n file_1.txt 

1. the name should consist of a first name and a last name, separated by a space. 
grep -E '^[A-Za-z]+ [A-Za-z]+$' names.txt 
2. Write the command that finds all usernames from names.txt that contain at least one 
numeric character. 
grep -E '[0-9]' names.txt 
3. Write the command that finds all usernames from names.txt that are exactly 4 
characters long and consist only of alphabetic characters. 
grep -E '^[a-zA-Z]{4}$' names.txt 
4. Write the command that finds all first and last names from names.txt . A name is an 
uppercase letter followed by one or more lowercase letters and first and last names are 
separated by a single space. Your command should not match against names that 
contain a middle name or initials. 
grep -E '^[A-Z][a-z]+ [A-Z][a-z]+$' names.txt 

5. Must be at least 8 characters long. 
grep -E '.{8,}' names.txt 
6. Must contain at least one uppercase character. 
grep -E '[A-Z]{1,}' names.txt 
7. Must contain at least one lowercase character. 
grep -E '[a-z]{1,}' names.txt 
8. Must contain at least one digit. 
grep -E '[0-9]{1,}' names.txt 
9. Write a regular expression that matches any string containing exactly four consecutive 
consonants. For the purposes of this specific problem, the vowels are a, e, i, o, u, y. 
All other letters are consonants. 
grep -E '[^aeiouy]{4}' names.txt 
10. Write a regular expression that matches any string that contains no instances of the 
letter e. 
grep -v 'e' names.txt 
11. Write a regular expression that matches any string that begins and ends with a vowel 
and has no vowels in between. For the purposes of this specific problem, y is neither 
consonant nor vowel, so consonants are the 20 letters that are not one of a, e, i, o, u, y 
and vowels are a, e, i, o, u. The words need not begin and end with the same vowel, so 
angle is a valid match. 
grep -Ei '^[aeiou][^aeiouy]*[aeiou]$' names.txt

1. print lines numbers of lines beginning with “O” 
sed -n '/^o/=' file.txt 
= command is used to print current line number 
2. delete digits in the given input file. 
sed '/[0-9]/d' file.txt 
3. delete lines that contain both BEGIN and END 
sed -E '/begin.*end|end.*begin/d' file.txt 
4. delete lines that contain BEGIN but not END 
sed '/begin/{/end/b;d}' file.txt 
/begin/ - find line which contain begin 
{} – defines a block 
/end/ - find end in the lines which contain begin 
b – branch to end of script if end is found 
d – delete if end is not found 
; - separator between sed commands 
5. deletes the first character in each line in a file 
sed 's/^.//' file.txt 
substitute first character with nothing, deletes the first character. 
6. deletes the last character in each line in a file 
sed 's/.$//' file.txt 
substitute last character with nothing. 
7. deletes the first character, (if it numeric ) in each line in a file. 
sed 's/^[0-9]//' file.txt 
substitute first character if it is numeric with nothing. 
8. deletes the character before the last character in each line in a file. 
sed 's/.\(.\)$/\1/' file.txt 
or  
sed -E 's/.(.)$/\1/' file.txt 
Substitute last but one character with last character. 
(.) captures last character. 
\1 first captured group 
9. that swaps the first and second words in each line in a file. 
sed 's/\([^ ]*\) \([^ ]*\)/\2 \1/' file.txt 
or 
sed -E 's/([^ ]*) ([^ ]*)/\2 \1/' file.txt 
([^ ]*) - capture 0 or more characters that are not empty as a group 
Swap the two captured groups 
10. replace the word “mcis” with “sois” in the first five lines in a file. 
sed '1,5 s/mcis/sois/g' file.txt 
11. add “SOIS”  prefix to all the lines 
sed 's/^/SOIS /' file.txt 
12. add  “.”  at the end of each line in the file. 
sed 's/$/./' file.txt 
13. Pick the line with Social security number in the format of 999-99-9999 
sed -nE '/[0-9]{3}-[0-9]{2}-[0-9]{4}/p' file.txt 
14. Pick the Valid IP address of the computer (4 numbers separated by ‘.’). (e.g. 192.168.0.1)  
sed -nE '/\b([0-9]{1,3}\.){3}[0-9]{1,3}\b/p' file.txt 
Form a group which is repeated 3 times. 
15. Pick the Valid URL beginning with “http://”. (e.g. http://manipal.edu) 
sed -nE '/\bhttp:\/\/[a-zA-Z0-9.-]*\b/p' file.txt 
16. Pick the Valid email address, assuming ‘a-z’,’0-9’,’-‘,’.’ are the valid characters for user ID, 
and domain name has to end with either “.com” or “.net” 
sed -nE '/\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+(com|net)\b/p' file.txt 
17. Print all lines containing words that start with "f" and end with "s". 
sed -nE '/\bf[a-zA-Z]*s\b/p' file.txt 
18. Print lines containing a capital "L", but not as the first character on the line. 
sed -n '/^[^L].*[L].*$/p' file.txt 
19. matches dates in the American MM-DD-YYYY format where months and days can be 1 or 
2 digits, years must be 4 digits starting with a 1 or a 2, and the delimiter is either "-" or 
"/" but not both. 
sed -nE '/\b(1[0-2]|[0-9])([-/])(3[0-1]|2[0-9]|1[0-9])\2([1|2][0-9]{3})\b/p' file.txt 
20.  print all the lines of a file that are less than 10 characters in length. 
sed -nE '/^.{,9}$/p' file.txt 
21. replace all occurrences in a file of "the" with "a" and "The" with "A". 
sed -n 's/\bthe\b/a/gp; s/\bThe\b/A/gp' file.txt 
To print only changed line use -n and then use print command /p 
22. substitute the word "button" for "tree", only if tree occurs at the end of a line. 
sed -n 's/\btree$/button/gp' file.txt 
23.  substitute the word foible for the word tree but not the word trees. 
sed -n 's/\btree\b/foible/gp' file.txt 

3. Configure 
a. Configure the username for particular repo. 
git config --local user.name Hrishi 
b. Configure the email for every repo 
git config --global user.email hrishi@gmail.com 
c. Set default editor for every repo 
git config --global core.editor gedit 
d. View all the settings 
git config -l 
e. Change the username for every repo 
git config --global user.name Hrishikesh 

4. Initiate git project  
a. Create a folder “VersionControl”. 
mkdir VersionControl 
b. Initiate the folder to git 
git init 
c. Create a file called  “README”  
touch README 
d. Create a file called  “Basiccommands.txt” 
touch Basiccommands.txt 
e. Create a file called “gethelp.txt” 
touch gethelp.txt 
f. 
ls 
List the files in the working directory 
g. List the files in the staging area 
git ls-files 

5. Staging Area 
a. Add README file to staging environment. 
git add README 
b. List the files in the working area 
ls 
c. List the files in the staging area 
git ls-files 
d. Add all the .txt files to staging environment. 
git add *.txt 
e. List the files in the staging area 
git ls-files 
f. 
ls 

6. Commit  
a. Commit the changes to the repo with the message “created files”  
git commit -m "created files" 
b. Check the status 
git status 

7. log  
a. check the log  
git log 
b. shortlog 
git shortlog 

8. Explore the contents of the file   
a. List the files of working directory.  
ls 
b. List the files of staging area 
git ls-files 
c. List the files of repo 
git ls-tree master 
d. View the contents of files 
cat README 
c. Update the contents of “README” file 
cat >> README 
d. Commit the updated file directly, skip the staging environment. 
git commit -a -m "Updated README" 
e. Check the status 
git status 
f. Check the log
git log 
Check the log 

9. Rename file  
a. Rename the file 
mv 
b. Rename the file “README” to “Instructions” using mv command.  
mv README Instructions 
c. Check the status  
git status 
d. Add to staging area 
git rm README 
git add Instructions 
e. Commit with proper message  
git commit -m "Renaming README to Instructions" 
f. 
Rename the file “Instructions” to “README” using git mv command  
git mv Instructions README 
g. Check the status  
git status 
h. Commit with proper message  
git commit -m "Renaming Instructions to README" 

10. Restore (similar to undo)  
a. Insert few lines to the file “README”  
cat >> README 
b.  Add the updated file to staging area.  
git add README 
c. Restore the file the from the staging area 
git restore --staged README 
d. Restore from the working area 
git checkout – README 

12. Branch 
a. List the branches  
git branch 
b. Create a branch “b1”        
git branch b1 
c. List the branches                
git branch 
| Ans: git branch “b1” 
| Ans: git branch 
d. Move to the branch “b1”  | git checkout “b1” 
git checkout b1 
e. Find out the current branch name | git branch 
git branch 
f. 
Create a branch called “b2” and move to the “b2”  in single command 
git checkout -b b2 
g. Find out the current branch name  
git branch
h. Move between one branch to another  
git checkout b1 
i. 
git branch 
j. 
List the names of branch  
View the contents of the master branch |  git ls-tree <branchname> cat 
.git/refs/head/master 
git ls-tree master 
k. Check the contents of branches are same or not  
git ls-tree b1 
git ls-tree b2 
l. 
Rename the branch  “b1” to “branch1” | git checkout b1; git branch -m “branch1” 
git checkout b1; git branch -m branch1 
m. Check whether the branch name is changed or not | git branch 
git branch 
n. Delete the branch “b1” | git checkout master; git branch -d <branch name> 
git checkout master; git branch -d branch1 
o. List out the branch names  
git branch 
p. Move to branch b2  
git checkout b2 
q. Update README file , add to staging area, commit with proper message  
cat >> README 
git add README 
git commit -m "Updating README from branch b2" 
r. 
Check the contents of b2 and master is same or not  
git ls-tree b2 
git ls-tree master 
They are different Commit ID of README is different. 
s. Try to delete branch b2 
git branch -d b2
13. Merge 
a. Merge the file b2 to master 
git merge b2 
b. Check the contents of b2 and master are same or not  
git ls-tree b2 
git ls-tree master 
Both branches are same can be confirmed by checking commit ID. 
c. Delete b2 
git branch -d b2

15. Alias  
a. Create a shortcut to command “checkout to co”  
git config --global alias.co checkout 
b. List out the alias  
git config --global –list 


1. count the number of lines. 
awk 'END {print NR}' file.txt 
2. print all lines containing ‘‘doug’’. 
awk '/doug/ {print}' file.txt 
3. print all lines containing ‘‘doug’’, ‘‘ken’’ or ‘‘dmr’’. 
awk '/doug|ken|dmr/ {print}' file.txt 
4. print the third field of each line. 
awk '{print $3}' file.txt 
5. print the third and second fields of each line, in that order. 
awk '{print $3, $2}' file.txt 
6. print each line prefixed by ‘‘line-number : ’’.  
awk '{print NR " : " $0}' file.txt 
7. sum the fourth column of a table. 
awk 'BEGIN {sum=0} {sum=sum+$4} END {print sum}' file.txt 
8. Provided a text file with lines containing 3 numbers each (named numbers): 
1 1 2  
3 4 3 
6 123 235 
924 35 924 
5234 3 1 2  
Write an awk script that will output the average of the three numbers for each line. 
awk -f average.awk numbers.txt 
{
  sum=0;
  for(i=1; i<=3; i++)
    sum=sum+$i;
  print sum/3;
}
9. Adapt the script written in exercise 2 to be able to process lines with varying amounts of 
numbers (named numbers):  
1 2 3 4 5 
4 5  
123 235 924 234 6123  
35 5234  
324 52 69 
awk -f average.awk numbers.txt 
{
  sum=0;
  for(i=1; i<=NF; i++)
    sum=sum+$i;
  print sum/NF;
}
10. A file can also contain different field and record separators. For example (file available as 
numbers3 ): 1,2,3;4,3,6;123,235,924;35,924,5234;3,1,2  
awk -f average.awk numbers.txt 
BEGIN{
  FS = ",";
  RS = ";";
}
{
  sum=0;
  for(i=1; i<=3; i++)
    sum=sum+$i;
  print sum/3;
}
11.  Consider the following file “emp.txt” fields are separated by tabs 
Beth 11.00 0 
Dan 10.75 0 
Kathy 15.00 10  
Mark 23.5 22  
Mary 17.75 24 
Susie 22.5 40 
Write a program that processes the above file and display the output as follows name ‐> hourly 
rate ‐> hours ‐> pay   (where ‐> is a tab) Followed by a list of all employees, horly rate, number of 
hours and total pay After the list, the following information is displayed X employees  (where X is 
the number of employees in the file) Total pay is Y (the total paid money Average pay is Z 
(average pay per employees) 
awk -f emp.awk emp.txt 
BEGIN{
  FS = "\t";
  OFS = "\t";
  print "Name\tHourly Rates\tHours\tPay";
}
{
  pay = $2 * $3;
  print $0, pay;
  total_pay = total_pay + pay;
}
END{
  print "Number of Employess : NR";
  print "Total Pay is : " total_pay;
  print "Average Pay is : " total_pay/NR;
}
12. Find regular expressions which Extract lines with the character 1 
awk '/1/{print}' file.txt 

13. Extract lines with only two characters 
awk 'length($0)==2' file.txt 
14. Extract lines beginning with a bracket 
awk '/^[(){}\[\]]/' file.txt 
15.  Extract lines with only upper-case letters 
awk '/^[A-Z]+$/' file.txt 
16. Extract lines finishing with 2. 
awk '/2$/' file.txt 
17. Extract lines from 10 to 20. 
awk 'NR>10 && NR<=20' file.txt 
18.  Extract column 5 and 7 from the count file. 
awk '{print $5, $7}' file.txt 
19.  Extract column 5 and 7 if value in column 6 greater than 1000 
awk '$6 > 1000 {print $5, $7}' file.txt 
20. Extract lines where second column is longer than 13 
awk 'length($2) > 13' file.txt 
21. Create a new file with column 1,2 and value of column 3 multiplied by 3. 
awk '{print $1, $2, $3*3}' file.txt > file_x3.txt 
22. Create a new file with line numbers in the first column and the number of fields in the last 
one. 
awk '{print NR, $0, NF}' file.txt > file_new.txt 
23. Create a new file with the sum of the line at the end of the line. 
awk '{sum=0; for(i=1; i<=NF; i++) sum=sum+$i; print $0, sum}' file.txt > file_new.txt 
24. Calculate sum of column 4 when column 1 is less than 100. 
awk '$1 < 100 {sum=sum+$4} END{print sum}' file.txt 

1. To pick out lines that have at least two p's followed by any number of letters followed 
by 'ore'. The p's do not have to be next to each other. 
grep -E "p.*p.*ore" file.txt 
2.  Begins with a decimal digit: 0 through 9. 
grep -E "^[0-9]" file.txt 
3.  Begins with a hexadecimal digit: 0 through 9, a through f, or A through F. 
grep -E "^[0-9|a-f|A-F]" file.txt 
4. Entire line is a three-digit, decimal value. 
grep -E "^[0-9]{3}$" file.txt 
5. Entire line consists of hexadecimal digits. 
grep -E "^[0-9|a-f|A-F]+$" file.txt 
6. Entire line consists of alphabetic characters, either lower- or upper-case. 
grep -E "^[a-z|A-Z]+$" file.txt 
7. Line contains a phone number of the form (217) xxx-xxxx. 
grep -E '\(217\) [0-9]{3}-[0-9]{4}' file.txt 
8.  Line contains a phone number of the form (312) xxx-xxxx or (708) xxx-xxxx. 
grep -E '\(312|708\) [0-9]{3}-[0-9]{4}' file.txt 
9.  Line has at least one period. 
grep -E "\." file.txt 
10. Line has a human-readable IP address1. 
grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" file.txt 
11.  Line includes a quoted string; i.e., text enclosed within double quotes. 
grep -E "\".*\"" file.txt 
12.  Line includes a dollar amount with dollars and cents, such as $123.46. There must be 
at least one digit for the dollar amount and exactly two digits for the number of cents. 
grep -E '\$[0-9]+\.[0-9]{2}' file.txt 
13. Line is longer than 10 characters. 
grep -E "^.{11,}$" file.txt 
14.  Line is shorter than 10 characters. 
grep -E "^.{,9}$" file.txt 
15.  Find all patterns that matches the pattern “ted” or “fred”. 
grep -E 'ted|fred' file.txt 
16.  Find all patterns that matches ed, ted or fed 
grep -E '[t|f]*ed' file.txt 
17. Find all patterns that does not begin with “g” 
grep -v '^g' file.txt 
18. Find all patterns that begins with g or any digit from 0-9 
grep -v '^[g|0-9]' file.txt 
19. Find all patterns that begins with “guna”. 
grep '^gunna' file.txt 
20. Find lines in a file where the pattern “sam” occurs at least twice. 
grep -E '(sam){1,}' file.txt 
21. Find all lines in a file that contain email addresses 
grep -E '*@.*\.' file.txt 
22. Write a regex that matches any number between 1000 and 9999 
grep -E '\<[1-9][0-9]{3}\>' file.txt 
23. Write a regex that matches any number between 100 and 9999 
grep -E '\<[1-9][0-9]{2,3}\>' file.txt 
24. Write a regex that lists all the files in the current directory that was created in January 
and are txt files. 
ls -l | grep Feb | grep '\.txt' 
25. Write a grep command that selects the lines from the file1 that have exactly three 
characters 
grep -E '^.{3}$' file.txt 
26. Write a grep command that selects the lines from the file1 that have at least three 
characters. 
grep -E '^.{3,}$' file.txt 
27. Write a grep command that selects the lines from the file1 that have three or fewer 
characters 
grep -E '^.{,3}$' file.txt 
28. Write a grep command that count the number blank lines in the file1 
grep -c '^$' file.txt 
29. Write a grep command that count the number nonblank lines in the file1 
grep -cv '^$' file.txt 
30. Write a grep command that selects the lines from the file1 that have the string UNIX. 
grep 'UNIX' file.txt 
31. Write a grep command that selects the lines from the file1 that have only the string 
UNIX. 
grep '^UNIX$' file.txt 
32. Write a grep command that copy the file to the monitor, but delete the blank lines. 
grep -v '^$' file.txt 
33. Write a grep command that selects the lines from the file1 that have at least two digits 
without any other characters in between. 
grep -E '[0-9]{2}' file.txt 
34. Write a grep command that selects the lines from the file1 that do not start with A to 
G. 
grep -E '^[^A-G]' file.txt 