#!/bin/bash

student_name="bhushan"

echo student_name = $student_name
echo student_name = ${student_name}

DATE=2022-01-22
echo Good morning, today date is $DATE

#command substitution
DATE=$(date +%F)
echo Good Morning, today date is $DATE

#Arthematic substitution
EXPR1=$((2+3+5*3/8-4))
echo EXPR1 OUTPUT=$EXPR1

##trying to access a variable from shell command line
echo Course Name = $COURSE_NAME
