#!/bin/bash
#echo mongodb

#curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.rep

#1. Install Mongo & Start Service.

# yum install -y mongodb-org
# systemctl enable mongod
# systemctl start mongod

#1. Update Listen IP address from 127.0.0.1 to 0.0.0.0 in config file

#Config file: `/etc/mongod.conf`

#then restart the service

# systemctl restart mongod
## Every Database needs the schema to be loaded for the application to work.
#Download the schema and load it.

# curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"

# cd /tmp
# unzip mongodb.zip
# cd mongodb-main

# mongo < catalogue.js
# mongo < users.js

#Symbol `<` will take the input from a file and give that input to the command.
echo mongodb


source components/common.sh

echo "Download Mongodb repo File"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE
STAT $?

echo "Install MongoDB"
yum install -y mongodb-org &>>$LOG_FILE
STAT $?

echo "Upate MongoDB config file"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$LOG_FILE
STAT $?
echo "Start Database"
systemctl enable mongod &>>$LOG_FILE
STAT $?
systemctl start mongod &>>$LOG_FILE
STAT $?
echo "Download Schema"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$LOG_FILE
STAT $?
echo "Extract Schema"
cd /tmp/
unzip -o mongodb.zip &>>$LOG_FILE
STAT $?
echo "Load schema"
cd mongodb-main

for app in catalogue users ; do
  mongo < ${app}.js &>>$LOG_FILE
done
STAT $?



