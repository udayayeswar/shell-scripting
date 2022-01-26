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
echo frentend
LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE

echo "installing NGINX"
yum install nginx -y  &>>$LOG_FILE

echo "Download Frontend Content"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"  &>>$LOG_FILE

echo "clean old content"
rm -rf /usr/share/nginx/html/* &>>$LOG_FILE

echo "Extract frontend Content"
cd /usr/share/nginx/html/ &>>$LOG_FILE
unzip /tmp/frontend.zip &>>$LOG_FILE








