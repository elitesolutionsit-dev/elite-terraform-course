#!/bin/bash -x
exec > >(tee /var/log/userdata.log) 2>&1

yum update -y

sudo su - adminuser
sudo yum install mariadb-server mariadb -y
sudo yum install -y httpd mariadb-server
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl is-enabled httpd

sudo usermod -a -G apache adminuser
sudo chown -R adminuser:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

​
echo ${config_file}
exists=$(sudo cat /var/www/html/wp-config.php| grep DB_HOST|cut -d\' -f 4)
echo $exists
​
if [[ ${mssql_sqlserver} == $exists ]];
then
        echo "True"
else
        sudo sed -i s+$exists+${mssql_sqlserver}+g ${config_file}
fi
​
# Allow wordpress to use Permalinks
sudo sed -i '151s/None/All/' /etc/httpd/conf/httpd.conf

# Grant file ownership of /var/www & its contents to apache user
sudo chown -R apache /var/www
​
# Grant group ownership of /var/www & contents to apache group
sudo chgrp -R apache /var/www
​
# Change directory permissions of /var/www & its subdir to add group write 
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
​
# Recursively change file permission of /var/www & subdir to add group write permmission
sudo find /var/www -type f -exec sudo chmod 0664 {} \;
​
​
field=$(mysql --user=${db_user} --password=${db_password} --host=${mssql_sqlserver} --database=${db_name} --batch --skip-column-names --execute="SELECT option_value FROM wp_options WHERE option_name = 'siteurl';")
​
if [[ ${appgateway} == $field ]];
then 
    echo "Already Updated"
else
    mysql --user=${db_user} --password=${db_password} --host=${mssql_sqlserver} --database=${db_name} --execute="UPDATE wp_options SET option_value='${appgateway}' WHERE option_value LIKE 'http%';" 
fi
​
# Restart Apache 
sudo systemctl restart httpd
sudo service httpd restart