##This is a set-up script for the latest MySQL on CentOS7

#!/bin/sh

##remove mariadb
yum -y remove mariadb-libs
yum -y remove mysql-community-*
rm -rf /var/lib/mysql/

##update
yum update

##install mysql
yum list | grep mysql-community-server
yum localinstall http://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm
yum -y install mysql-community-server
yum -y install mysql-community-client

##start mysqld
systemctl start mysqld.service
systemctl enable mysqld.service
systemctl status mysqld.service
ps auxw | grep mysqld

##get a temporary password
cat /var/log/mysqld.log | grep "temporary password"
