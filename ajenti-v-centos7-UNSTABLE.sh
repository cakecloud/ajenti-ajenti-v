export LC_ALL="en_US.UTF-8"

yum clean all
yum -y update
yum -y install epel-release
yum repolist
yum install wget
wget https://raw.githubusercontent.com/ajenti/ajenti/1.x/scripts/install-rhel.sh
bash install-rhel.sh
firewall-cmd --zone=public --permanent --add-port=8000/tcp
firewall-cmd --reload

rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

yum install -y yum-utils
yum-config-manager --disable remi-php56
yum-config-manager --enable remi-php56
yum-config-manager --enable remi-php71
yum-config-manager --enable remi-php72
yum-config-manager --enable remi-php73
yum-config-manager --enable remi-php74

yum install -y software-properties-common curl nano vim wget git tar unzip tmux ncdu ranger htop gnupg

yum install -y mariadb-server mariadb-client redis-server openvpn fail2ban libpcre3-dev libssl-dev dpkg-dev libgd-dev php-all-dev pkg-php-tools memcached php-memcached easy-rsa bind9 bind9utils bind9-doc redis-server openvpn nginx-full dehydrated

yum -y install php php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json php-pdo php-pecl-apcu php-pecl-apcu-devel

yum install -y php-cgi php-cli php-dev php-common php-xmlrpc php-enchant php-imap php-xsl php-pspell php-tidy php-opcache php-bz2 php-readline php-sybase php-intl

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

pip3 install pip==9.0.3

yum install -y ajenti-v ajenti-v-nginx ajenti-v-mysql ajenti-v-python-gunicorn 
yum install -y ajenti-v-php5.6-fpm ajenti-v-php7.1-fpm ajenti-v-php7.2-fpm ajenti-v-php7.3-fpm ajenti-v-php7.4-fpm 
service ajenti restart

yum clean all
yum -y update
