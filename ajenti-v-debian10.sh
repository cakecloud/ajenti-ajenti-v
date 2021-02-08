apt-get update
apt-get install wget curl gnupg -y
wget https://raw.github.com/ajenti/ajenti/1.x/scripts/install-debian.sh
wget http://security.ubuntu.com/ubuntu/pool/universe/p/pillow/python-imaging_3.1.2-0ubuntu1.5_all.deb
dpkg -i python-imaging_3.1.2-0ubuntu1.5_all.deb
apt install python-pil
apt --fix-broken install
dpkg -i python-imaging_3.1.2-0ubuntu1.5_all.deb
bash install-debian.sh 

apt-get install -y --allow-unauthenticated software-properties-common curl nano vim wget git tar unzip tmux ncdu ranger htop gnupg
apt-get install -y mariadb-server mariadb-client redis-server openvpn fail2ban
export LC_ALL="en_US.UTF-8"
apt-get install -yq --allow-unauthenticated --no-install-recommends libpcre3-dev libssl-dev dpkg-dev libgd-dev

apt-get -y --allow-unauthenticated install python3-pip python-pip
pip install awscli && pip uninstall urllib3 -y && pip install urllib3==1.23
pip3 install awscli && pip3 uninstall urllib3 -y && pip3 install urllib3==1.23

pip install pip==9.0.3
pip3 install pip==9.0.3

apt remove apache2 -y
apt autoremove -y
apt-get install -y --allow-unauthenticated nginx-full
apt-get install -yq --allow-unauthenticated php7.4-fpm php7.4-mbstring php7.4-cgi php7.4-cli php7.4-dev php7.4-geoip php7.4-common php7.4-xmlrpc
apt-get install -yq --allow-unauthenticated php7.4-dev php7.4-curl php7.4-enchant php7.4-imap php7.4-xsl php7.4-mysql php7.4-mysqlnd php7.4-pspell php7.4-gd
apt-get install -yq --allow-unauthenticated php7.4-tidy php7.4-opcache php7.4-json php7.4-bz2 php7.4-pgsql php-mcrypt php-readline php7.4-sybase
apt-get install -yq --allow-unauthenticated php7.4-intl php7.4-sqlite3 php7.4-ldap php7.4-xml php7.4-redis php7.4-imagick php7.4-zip
apt-get install -yq --allow-unauthenticated php7.4-fpm php7.4-mbstring php7.4-cgi php7.4-cli php7.4-dev php7.4-geoip php7.4-common php7.4-xmlrpc
apt-get install -yq --allow-unauthenticated php-fpm php-mbstring php-cgi php-cli php-dev php-common php-xmlrpc php-dev php-curl php-enchant php-imap php-xsl php-mysql php-mysqlnd php-pspell php-gd php-tidy php-opcache php-json php-bz2 php-readline php-sybase php-intl php-sqlite3 php-ldap php-xml php-zip -yf

apt-get install -yq ajenti-v-php7.4-fpm ajenti-v ajenti-v-nginx ajenti-v-mysql ajenti-v-mail ajenti-v-nodejs ajenti-v-python-gunicorn ajenti-v-ruby-unicorn php-all-dev pkg-php-tools
apt-get -yf autoremove
apt-get clean
service ajenti restart
