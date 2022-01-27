#!/bin/bash

if [ -f components/$1.sh ] ; then
  bash components/$1.sh
else
  echo -e "\e[1;31mInvalid Input\e[0m"
  echo -e "\e[1;33mAvalible Inputs - frontend|mongodb|catalogue|redis|users|cart|dispatch|mysql|payment|rabbitmq|shipping\e[0m"