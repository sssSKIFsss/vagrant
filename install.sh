# обновляем менеджер пакетов apt-get
sudo apt-get update



# устанавливаем имя и пароль пользователя MySQL в "root"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'



# устанавливаем cURL, PHP5, Apache, Git
sudo apt-get install -y vim curl python-software-properties

sudo add-apt-repository -y ppa:ondrej/php5

sudo apt-get update



sudo apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd 
php5-mcrypt php5-readline mysql-server-5.5 php5-mysql git-core php5-xdebug




# что-то
cat << EOF | sudo tee -a /etc/php5/mods-available/xdebug.ini
xdebug.scream=1
xdebug.cli_color=1
xdebug.show_local_vars=1
EOF


# включается модуль перезаписи Apache




sudo a2enmod rewrite


# отчет об ошибках


sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini

sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini

sed -i "s/disable_functions = .*/disable_functions = /" /etc/php5/cli/php.ini



# перезагрузка сервера
sudo service apache2 restart



# ставим компостер
curl -sS https://getcomposer.org/installer | php

sudo mv composer.phar /usr/local/bin/composer