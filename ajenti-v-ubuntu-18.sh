#!/bin/sh
apt-get update
apt-get install software-properties-common -y
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get install -y openssl ufw imagemagick python-pillow php7.4-curl php7.4-gd php7.4-mbstring php7.4-zip php7.4-xml unzip zip
wget http://launchpadlibrarian.net/333146932/python-imaging_4.1.1-3build2_all.deb
dpkg -i python-imaging_4.1.1-3build2_all.deb
wget -O- https://raw.github.com/ajenti/ajenti/1.x/scripts/install-ubuntu.sh | sudo sh
apt-get -yq install ajenti-v ajenti-v-nginx ajenti-v-mysql ajenti-v-php7.4-fpm ajenti-v-ftp-pureftpd php7.4-mysql
service ajenti restart

apt-get install -yq python3-pip python-pip wget curl git 
pip install pip==9.0.1
pip install requests==2.19.0
pip install urllib3==1.23
git clone https://github.com/matthewtoye/ajenti_letsencrypt_plugin.git /var/lib/ajenti/plugins/letsencrypt
git clone https://github.com/fatiherikli/nginxparser.git /root/nginxparser
service ajenti restart
git clone https://github.com/dehydrated-io/dehydrated.git /etc/dehydrated
cd /etc/dehydrated
/bin/bash dehydrated --register --accept-terms

ufw allow 80/tcp
ufw allow 443/tcp

#SETUP PureFTPD SSL
echo 1 > /etc/pure-ftpd/conf/TLS
IP=$(curl ifconfig.me)
mkdir -p /etc/ssl/private/
cp /etc/ajenti/ajenti.pem /etc/ssl/private/pure-ftpd.pem

#МОЖНО СГЕНЕРИРОВАТЬ ОТДЕЛЬНО СЕРТИФИКАТ А НЕ ИСПОЛЬЗОВАТЬ ОТ AJENTI
# HOSTNAME=$(hostname)
# openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
#    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=${IP}" \
#    -extensions SAN="${HOSTNAME}" \
#    -keyout /etc/ssl/private/pure-ftpd.pem  -out /etc/ssl/private/pure-ftpd.pem 
# chmod 600 /etc/ssl/private/pure-ftpd.pem

sed -i 's/# PassivePortRange             30000 50000/PassivePortRange             40110 40210/g' /etc/pure-ftpd/pure-ftpd.conf
echo "40110 40210" > /etc/pure-ftpd/conf/PassivePortRange
ufw allow 40110:40210/tcp
/etc/init.d/pure-ftpd restart
echo "###################################"
echo "ВХОД В AJENTI: https://${IP}:8000"
echo "ЛОГИН: root  ПАРОЛЬ: admin"
echo "###################################\n"
echo "Инструкцию по настройке можете посмотреть здесь:" 
echo "https://www.youtube.com/watch?v=SzKoPifm6OI\n"
echo "Либо кратко действуем по этой инструкции:"
echo "0) Меняем пароль для входа в веб-панель"
echo "1) Включаем Websites в Ajenti"
echo "2) Создаем сайт, который привязан к этому IP сервера Ajenti через А-запись у регистратора:"
echo "2.1) Создаем сайт, назначаем директорию"
echo "2.2) Добавляем домен" 
echo "2.3) Отключаем mentancemode" 
echo "2.4) Включаем PHP7.4 FastCGI в разделе Content" 
echo "2.5) Добавляем этокод в Advanced и жмем ПРИМЕНИТЬ ИЗМЕНЕНИЯ:"
echo "		location ^~ /.well-known/acme-challenge {"
echo "   		alias /var/www/dehydrated;"
echo "   	}"
echo "3) Переходим в раздел Security->Letsencrypt и создаем сертификат:"
echo "3.1) Кликаем на пустой домен(строку) и вписываем туда свой," 
echo "     и ниже в окно subdomains если нужно (к примеру www.YOURDOMAIN.ru)"
echo "3.2) Жмем SAVE"
echo "3.3) Ставим галочку FORCE RENEW и жмем REQUEST"
echo "4) Возвращаемся к сайту:"
echo "4.1) В разделе SSL указываем ключ и сертификат для сайта:"
echo "     cert: /etc/dehydrated/certs/YOURDOMAIN/fullchain.pem"
echo "     key: /etc/dehydrated/certs/YOURDOMAIN/privkey.pem"
echo "4.2) Создаем пользователя FTP, базу данных MySQL"
reboot
