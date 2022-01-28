echo catalogue

#```bash
# curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash -
# yum install nodejs gcc-c++ -y
#
#```
#
#1. Let's now set up the catalogue application.
#
#As part of operating system standards, we run all the applications and databases as a normal user but not with root user.
#
#So to run the catalogue service we choose to run as a normal user and that user name should be more relevant to the project. Hence we will use `roboshop` as the username to run the service.
#
#```bash
# useradd roboshop
#
#```
#
#1. So let's switch to the `roboshop` user and run the following commands.
#
#```bash
#$ curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
#$ cd /home/roboshop
#$ unzip /tmp/catalogue.zip
#$ mv catalogue-main catalogue
#$ cd /home/roboshop/catalogue
#$ npm install
#
#```
#
#1. Update SystemD file with correct IP addresses
#
#    Update `MONGO_DNSNAME` with MongoDB Server IP
#
#2. Now, lets set up the service with systemctl.
#
#```bash
# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue
#
#```
LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE


echo "setup Nodejs repo"
 curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash - &>>$LOG_FILE

echo "Install Nodejs"
yum install nodejs gcc-c++ -y &>>$LOG_FILE

echo "create app user"
useradd roboshop &>>$LOG_FILE

echo "Download catalogue code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG_FILE

echo "Extract Catalogue code"
cd /tmp/
unzip /tmp/catalogue.zip &>>$LOG_FILE

echo "Clean Old Catalogue"
rm -rf /home/roboshop/catalogue

echo "copy Catalogue content"
cp -r catalogue-main /home/roboshop/catalogue

echo "Install NodeJS dependencies"
cd /home/roboshop/catalogue
npm install &>>$LOG_FILE

chown roboshop:roboshop /home/roboshop/ -R &>>$LOG_FILE

echo "Updata SystemD file"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop-internal/'
 /home/roboshop/catalogue/systemd.service &>>$LOG_FILE

echo "Setup Catalogue SystemD file"
mv  /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service &>>$LOG_FILE

echo "Start Catalogue"
systemctl daemon-reload &>>$LOG_FILE
systemctl enable catalogue &>>$LOG_FILE
systemctl start catalogue &>>$LOG_FILE

_


