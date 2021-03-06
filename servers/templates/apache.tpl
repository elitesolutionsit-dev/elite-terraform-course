#!/bin/bash -x
exec > >(tee /var/log/userdata.log) 2>&1


sudo apt update -y
sudo apt install mariadb-server mariadb-client -y

sudo apt install apache2 -y
sudo apt install php7.4 php7.4-mysql php-common php7.4-cli php7.4-json php7.4-common php7.4-opcache libapache2-mod-php7.4 -y

sudo useradd apache
sudo usermod -a -G apache adminuser
sudo chown -R adminuser:apache /var/www

sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

# Grant file ownership of /var/www & its contents to apache user
sudo chown -R apache /var/www

# Grant group ownership of /var/www & contents to apache group
sudo chgrp -R apache /var/www

# Change directory permissions of /var/www & its subdir to add group write 
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;

# Recursively change file permission of /var/www & subdir to add group write permmission
sudo find /var/www -type f -exec sudo chmod 0664 {} \;

field=$(mysql --user=${db_username} --password=${db_password} --host=${mssql_sqlserver} --database=${db_name} --batch --skip-column-names --execute="SELECT option_value FROM wp_options WHERE option_name = 'siteurl';")

if [[ ${appgateway} == $field ]];
then 
    echo "Already Updated"
else
    mysql --user=${db_username} --password=${db_password} --host=${mssql_sqlserver} --database=${db_name} --execute="UPDATE wp_options SET option_value='${appgateway}' WHERE option_value LIKE 'http%';" 
fi