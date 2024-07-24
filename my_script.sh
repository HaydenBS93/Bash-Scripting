#!/bin/bash

# Update the package repository
sudo apt-get update -y

# Install Apache
sudo apt-get install apache2 -y

# Start Apache
sudo systemctl start apache2
sudo systemctl enable apache2

# Install MySQL
sudo apt-get install mysql-server -y

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

# Install PHP and PHP-MySQL module
sudo apt-get install php php-mysql -y

# Restart Apache to load PHP
sudo systemctl restart apache2

# Test PHP
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

# Adjust firewall to allow HTTP traffic
sudo ufw allow 'Apache'
sudo ufw enable
