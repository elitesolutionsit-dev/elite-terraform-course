#!/bin/bash
sudo apt update  -y
sudo apt upgrade -y

# install apache server
sudo apt install -y apache2

# download mysql package to apt  and install mysql server from apt
sudo apt install -y mysql-server mysql-common


# starting apache and mysql server and register them to startup
sudo systemctl enable --now  apache2
sudo systemctl enable --now mysql

# Change OWNER and permission of directory /var/www  & its subdir to add group write
sudo usermod -a -G ubuntu ubuntu
sudo chown -R ubuntu:ubuntu /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

#stopping mysql and starting with safe mode
sudo systemctl stop mysql
mkdir /var/run/mysqld
chown mysql:mysql /var/run/mysqld
mysqld_safe --skip-grant-tables >res 2>&1 &

killall -v mysqld
sudo systemctl stop mysql 
sudo systemctl start mysql

# grant privileges
mysql -uroot -p${db_user_password} -e "CREATE USER '${db_username}'@'${mssql_host}' IDENTIFIED BY '$db_user_password';"
mysql -uroot -p${db_user_password} -e "GRANT ALL ON *.* TO '${db_username}'@'${mssql_host}';"
mysql --user=${db_username} --password=${db_user_password} --host=${mssql_host} --database=${db_name}

# restart apache
sudo systemctl restart apache2