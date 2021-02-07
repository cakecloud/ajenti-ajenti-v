apt update && apt-get upgrade -y

wget http://repo.ajenti.org/debian/key -O- | sudo apt-key add -
echo "deb http://repo.ajenti.org/ng/debian main main ubuntu" | sudo tee -a /etc/apt/sources.list
apt-get update && sudo apt-get install ajenti
service ajenti restart

apt-get install -y --allow-unauthenticated software-properties-common curl nano vim wget git tar unzip tmux ncdu ranger htop 
add-apt-repository ppa:ondrej/php -y
apt-get update

apt-get install -y mariadb-server mariadb-client redis-server openvpn fail2ban
dpkg --configure -a

export LC_ALL="en_US.UTF-8"

apt-get install -yq --allow-unauthenticated --no-install-recommends libpcre3-dev libssl-dev dpkg-dev libgd-dev
apt-get install -yq --allow-unauthenticated php-all-dev pkg-php-tools

curl -SL https://download.microsoft.com/download/D/7/A/ -o /tmp/dotnet.tar.gz
mkdir -p /usr/share/dotnet
tar -zxf /tmp/dotnet.tar.gz -C /usr/share/dotnet
ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

apt-get install -yf --allow-unauthenticated nodejs memcached php-memcached easy-rsa bind9 bind9utils bind9-doc redis-server openvpn     
ln -sf "$(which nodejs)" /usr/bin/node
curl -O https://bootstrap.pypa.io/get-pip.py \
	python get-pip.py \
    pip install awscli \
ln -sf "$(which nodejs)" /usr/bin/node

apt-get -y --allow-unauthenticated install python3-pip python-pip


pip install awscli \
&& pip uninstall urllib3 -y \
&& pip install urllib3==1.23

pip3 install awscli \
&& pip3 uninstall urllib3 -y \
&& pip3 install urllib3==1.23

cd /tmp
curl -SL https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz -o /tmp/golang.tar.gz
tar -zxf golang.tar.gz
mv go /usr/local
echo "\nGOROOT=/usr/local/go\nexport GOROOT\n" >> /root/.profile

apt remove apache2 -y
apt autoremove -y
apt-get install -y --allow-unauthenticated nginx-full

apt-get install -yq --allow-unauthenticated ajenti-v-php5.6-fpm && \
apt-get install -yq --allow-unauthenticated php5.6-fpm php5.6-mbstring php5.6-cgi php5.6-cli php5.6-dev php5.6-geoip php5.6-common php5.6-xmlrpc && \
apt-get install -yq --allow-unauthenticated php5.6-dev php5.6-curl php5.6-enchant php5.6-imap php5.6-xsl php5.6-mysql php5.6-mysqlnd php5.6-pspell php5.6-gd && \
apt-get install -yq --allow-unauthenticated php5.6-tidy php5.6-opcache php5.6-json php5.6-bz2 php5.6-pgsql php-mcrypt php-readline php5.6-sybase && \
apt-get install -yq --allow-unauthenticated php5.6-intl php5.6-sqlite3 php5.6-ldap php5.6-xml php5.6-redis php5.6-imagick php5.6-zip

apt-get install -yq --allow-unauthenticated ajenti-v-php7.0-fpm && \
apt-get install -yq --allow-unauthenticated php7.0-fpm php7.0-mbstring php7.0-cgi php7.0-cli php7.0-dev php7.0-geoip php7.0-common php7.0-xmlrpc && \
apt-get install -yq --allow-unauthenticated php7.0-dev php7.0-curl php7.0-enchant php7.0-imap php7.0-xsl php7.0-mysql php7.0-mysqlnd php7.0-pspell php7.0-gd && \
apt-get install -yq --allow-unauthenticated php7.0-tidy php7.0-opcache php7.0-json php7.0-bz2 php7.0-pgsql php-mcrypt php-readline php7.0-sybase && \
apt-get install -yq --allow-unauthenticated php7.0-intl php7.0-sqlite3 php7.0-ldap php7.0-xml php7.0-redis php7.0-imagick php7.0-zip

apt-get install -yq --allow-unauthenticated php7.1-fpm php7.1-mbstring php7.1-cgi php7.1-cli php7.1-dev php7.1-geoip php7.1-common php7.1-xmlrpc && \
apt-get install -yq --allow-unauthenticated php7.1-dev php7.1-curl php7.1-enchant php7.1-imap php7.1-xsl php7.1-mysql php7.1-mysqlnd php7.1-pspell php7.1-gd && \
apt-get install -yq --allow-unauthenticated php7.1-tidy php7.1-opcache php7.1-json php7.1-bz2 php7.1-pgsql php-mcrypt php-readline php7.1-sybase && \
apt-get install -yq --allow-unauthenticated php7.1-intl php7.1-sqlite3 php7.1-ldap php7.1-xml php7.1-redis php7.1-imagick php7.1-zip

apt-get install -yq --allow-unauthenticated ajenti-v-php7.1-fpm && \
apt-get install -yq --allow-unauthenticated php7.1-fpm php7.1-mbstring php7.1-cgi php7.1-cli php7.1-dev php7.1-geoip php7.1-common php7.1-xmlrpc && \
apt-get install -yq --allow-unauthenticated php7.1-dev php7.1-curl php7.1-enchant php7.1-imap php7.1-xsl php7.1-mysql php7.1-mysqlnd php7.1-pspell php7.1-gd && \
apt-get install -yq --allow-unauthenticated php7.1-tidy php7.1-opcache php7.1-json php7.1-bz2 php7.1-pgsql php-mcrypt php-readline php7.1-sybase && \
apt-get install -yq --allow-unauthenticated php7.1-intl php7.1-sqlite3 php7.1-ldap php7.1-xml php7.1-redis php7.1-imagick php7.1-zip

apt-get install -yq --allow-unauthenticated ajenti-v-php7.2-fpm && \
apt-get install -yq --allow-unauthenticated php7.2-fpm php7.2-mbstring php7.2-cgi php7.2-cli php7.2-dev php7.2-geoip php7.2-common php7.2-xmlrpc && \
apt-get install -yq --allow-unauthenticated php7.2-dev php7.2-curl php7.2-enchant php7.2-imap php7.2-xsl php7.2-mysql php7.2-mysqlnd php7.2-pspell php7.2-gd && \
apt-get install -yq --allow-unauthenticated php7.2-tidy php7.2-opcache php7.2-json php7.2-bz2 php7.2-pgsql php-mcrypt php-readline php7.2-sybase && \
apt-get install -yq --allow-unauthenticated php7.2-intl php7.2-sqlite3 php7.2-ldap php7.2-xml php7.2-redis php7.2-imagick php7.2-zip

apt-get install -yq --allow-unauthenticated ajenti-v-php7.3-fpm && \
apt-get install -yq --allow-unauthenticated php7.3-fpm php7.3-mbstring php7.3-cgi php7.3-cli php7.3-dev php7.3-geoip php7.3-common php7.3-xmlrpc && \
apt-get install -yq --allow-unauthenticated php7.3-dev php7.3-curl php7.3-enchant php7.3-imap php7.3-xsl php7.3-mysql php7.3-mysqlnd php7.3-pspell php7.3-gd && \
apt-get install -yq --allow-unauthenticated php7.3-tidy php7.3-opcache php7.3-json php7.3-bz2 php7.3-pgsql php-mcrypt php-readline php7.3-sybase && \
apt-get install -yq --allow-unauthenticated php7.3-intl php7.3-sqlite3 php7.3-ldap php7.3-xml php7.3-redis php7.3-imagick php7.3-zip
    
apt-get install -yq --allow-unauthenticated php7.4-fpm php7.4-mbstring php7.4-cgi php7.4-cli php7.4-dev php7.4-geoip php7.4-common php7.4-xmlrpc
apt-get install -yq --allow-unauthenticated php7.4-dev php7.4-curl php7.4-enchant php7.4-imap php7.4-xsl php7.4-mysql php7.4-mysqlnd php7.4-pspell php7.4-gd
apt-get install -yq --allow-unauthenticated php7.4-tidy php7.4-opcache php7.4-json php7.4-bz2 php7.4-pgsql php-mcrypt php-readline php7.4-sybase
apt-get install -yq --allow-unauthenticated php7.4-intl php7.4-sqlite3 php7.4-ldap php7.4-xml php7.4-redis php7.4-imagick php7.4-zip
apt-get install -yq --allow-unauthenticated php-fpm php-mbstring php-cgi php-cli php-dev php-common php-xmlrpc \
        php-dev php-curl php-enchant php-imap php-xsl php-mysql php-mysqlnd php-pspell php-gd \
        php-tidy php-opcache php-json php-bz2 php-readline php-sybase \
        php-intl php-sqlite3 php-ldap php-xml php-zip -yf
	
apt-get update && apt-get install -y dehydrated 
	
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 5000M/" /etc/php/7.1/fpm/php.ini \
&& sed -i "s/post_max_size = 8M/post_max_size = 5000M/" /etc/php/7.1/fpm/php.ini \
&& sed -i "s/max_input_time = 60/max_input_time = 360000/" /etc/php/7.1/fpm/php.ini \
&& sed -i "s/max_execution_time = 30/max_execution_time = 360000/" /etc/php/7.1/fpm/php.ini \
&& sed -i -e "s/;sendmail_path =/sendmail_path = \/usr\/sbin\/exim \-t/g" /etc/php/7.1/fpm/php.ini

sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 5000M/" /etc/php/7.3/fpm/php.ini \
&& sed -i "s/post_max_size = 8M/post_max_size = 5000M/" /etc/php/7.3/fpm/php.ini \
&& sed -i "s/max_input_time = 60/max_input_time = 360000/" /etc/php/7.3/fpm/php.ini \
&& sed -i "s/max_execution_time = 30/max_execution_time = 360000/" /etc/php/7.3/fpm/php.ini \
&& sed -i -e "s/;sendmail_path =/sendmail_path = \/usr\/sbin\/exim \-t/g" /etc/php/7.3/fpm/php.ini

sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 5000M/" /etc/php/5.6/fpm/php.ini \
&& sed -i "s/post_max_size = 8M/post_max_size = 5000M/" /etc/php/5.6/fpm/php.ini \
&& sed -i "s/max_input_time = 60/max_input_time = 360000/" /etc/php/5.6/fpm/php.ini \
&& sed -i "s/max_execution_time = 30/max_execution_time = 360000/" /etc/php/5.6/fpm/php.ini \
&& sed -i -e "s/;sendmail_path =/sendmail_path = \/usr\/sbin\/exim \-t/g" /etc/php/5.6/fpm/php.ini

sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 5000M/" /etc/php/7.4/fpm/php.ini \
&& sed -i "s/post_max_size = 8M/post_max_size = 5000M/" /etc/php/7.4/fpm/php.ini \
&& sed -i "s/max_input_time = 60/max_input_time = 360000/" /etc/php/7.4/fpm/php.ini \
&& sed -i "s/max_execution_time = 30/max_execution_time = 360000/" /etc/php/7.4/fpm/php.ini \
&& sed -i -e "s/;sendmail_path =/sendmail_path = \/usr\/sbin\/exim \-t/g" /etc/php/7.4/fpm/php.ini

sed -i -e "s/127\.0\.0\.1/\*/g" /etc/redis/redis.conf \
&& sed -i -e 's:^save:# save:g' \
      -e 's:^bind:# bind:g' \
      -e 's:^logfile:# logfile:' \
      -e 's:daemonize yes:daemonize no:' \
      -e 's:# maxmemory \(.*\)$:maxmemory 512mb:' \
      -e 's:# maxmemory-policy \(.*\)$:maxmemory-policy allkeys-lru:' \
      /etc/redis/redis.conf

pip install pip==9.0.3
pip3 install pip==9.0.3

#Install ajenti-v
apt-get install -yq ajenti-v ajenti-v-nginx ajenti-v-mysql ajenti-v-mail ajenti-v-nodejs ajenti-v-python-gunicorn ajenti-v-ruby-unicorn php-all-dev pkg-php-tools
service ajenti restart

apt-get -yf autoremove
apt-get clean
service ajenti restart
