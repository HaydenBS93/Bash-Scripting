#!/bin/bash

# Moving to root user
sudo -i

# Update the package repository
yum update -y

# Install Apache
yum install httpd -y

# Start Apache
systemctl start httpd
systemctl enable httpd

# Install MySQL
yum install mariadb-server mariadb -y

# Start MySQL
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure MySQL installation
sudo mysql_secure_installation <<EOF

y
your_root_password
your_root_password
y
y
y
y
EOF

# Install PHP
yum install php php-mysql -y

# Restart Apache to load PHP
systemctl restart httpd

# Test PHP
echo "<?php phpinfo(); ?>" | tee /var/www/html/info.php

# Adjust firewall to allow HTTP traffic
firewall-cmd --permanent --add-service-http
firewall-cmd --reload
