#!/bin/bash

### string expressions
a=abc1
if [ $a = "abc" ]
then
  echo ok
fi

if [ $a != "abc" ];then
  echo NOTOK
fi

if [ -z "$b" ];then
  echo B is empty / not declared variable
fi