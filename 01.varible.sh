#!/bin/bash

student_name="bhushan"

echo student_name = $student_name
echo student_name = ${student_name}

DATE=2022-01-22
echo Good morning, today date is $DATE

#command substitution
DATE=$(date +%f)
echo Good Morning, today date is $DATE