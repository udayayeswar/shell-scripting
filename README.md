# shell-scripting
##

## sed editor 
...bash

# sed with -i edit the file
# sed without -i will print the change on output

# -e is for multilple conditions in sed command
# -e cond1 -e con2

# search and replace / substitute

sed -i -e 's/root/ROOT/g' -e 's/admin/ADMIN/g' sample.txt

#Delete Lines
sed -i -e '1d' -e '/root/d' sample.txt

#add lines
sed -i -e '1 i Hello World' sample.txt
sed -i -e '/root/ 1 Hellow World' sample.txt
