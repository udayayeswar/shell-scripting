#!/bin/bash

LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE
rm -f /etc/yum.repos.d/endpoint.repo

if [$1 -eq 0 ]; then
  echo -e "\e[1;32m SUCCESS\e[0m"
  else
    echo -e "\e[1;31m FAILED\e[0m"
  exit
 fi
