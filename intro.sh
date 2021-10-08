#!/bin/bash
echo "Hi , Welcome to LAMP Server Installation."

echo "DO you want an installation of LAMP Server on your device."

echo "type 'yes' to install or 'no' to quit."

read n
typeset -l n
if [[ $n = yes ]]
then
	if command -v apt-get >/dev/null; then


			echo -e "\n\nUpdating Apt Packages and upgrading latest patches\n"
			sudo apt-get update -y && sudo apt-get upgrade -y

			echo -e "\n\nInstalling Apache2 Web server\n"
			sudo apt-get install apache2

			echo -e "\n\nInstalling PHP & Requirements\n"
			sudo apt-get install libapache2-mod-php7.0 php7.0 php7.0-common php7.0-curl php7.0-dev   			  php7.0-gd php-pear php7.0-mcrypt php7.0-mysql -y

			echo -e "\n\nInstalling MySQL\n"
			sudo apt-get install mysql-server mysql-client -y

			echo -e "\n\nPermissions for /var/www\n"
			sudo chown -R www-data:www-data /var/www
			echo -e "\n\n Permissions have been set\n"

			echo -e "\n\nEnabling Modules\n"
			sudo a2enmod rewrite
			sudo phpenmod mcrypt

			echo -e "\n\nRestarting Apache\n"
			sudo service apache2 restart

			echo -e "\n\nLAMP Installation Completed"
			exit
	elif command -v yum >/dev/null; then
			echo -e "\n\nUpdating Apt Packages and upgrading latest patches\n"
                        sudo yum update -y

                        echo -e "\n\nInstalling Apache2 Web server\n"
                        sudo yum install httpd -y

                        echo -e "\n\nInstalling PHP & Requirements\n"
                        sudo  yum install httpd mod_ssl openssl mysql-server mysql php php-mysql php-gd php-mysql -y

                        echo -e "\n\nInstalling MySQL\n"
                        sudo yum install mysql-server mysql-client -y

                        echo -e "\n\nPermissions for /var/www\n"
                        sudo chown -R www-data:www-data /var/www
                        echo -e "\n\n Permissions have been set\n"

                        echo -e "\n\nEnabling Modules\n"
                        sudo a2enmod rewrite
                        sudo phpenmod mcrypt

                        echo -e "\n\nRestarting Apache\n"
                        sudo service httpd restart

                        echo -e "\n\nLAMP Installation Completed"
                        exit

	fi
else
echo	"thanks , bye"
	exit
fi
exit
