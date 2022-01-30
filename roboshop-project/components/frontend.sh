#!/bin/bash
# yum install nginx -y

# systemctl enable nginx
# systemctl start nginx

# curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-master README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf

# systemctl restart nginx
echo "frontend"

source components/common.sh

echo "installing NGINX"
yum install nginx -y  &>>$LOG_FILE
STAT $?

echo "Download Frontend Content"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"  &>>$LOG_FILE
STAT $?

echo "clean old content"
rm -rf /usr/share/nginx/html/* &>>$LOG_FILE
STAT $?

echo "Extract frontend Content"
cd /tmp
unzip -o frontend.zip &>>$LOG_FILE
STAT $?

echo "copy Extracted content to Nginx path"
cp -r frontend-main/static/* /usr/share/nginx/html/ &>>$LOG_FILE
STAT $?

echo "Copy Nginx roboshop config"
cp frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE
STAT $?

echo "Start Nginx Service"
systemctl enable nginx &>>$LOG_FILE
systemctl start nginx  &>>$LOG_FILE
STAT $?







