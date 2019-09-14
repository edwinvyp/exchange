#!bin/bash

sudo apt-get install git curl zlib1g-dev build-essential \
  libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
  libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev
gpg --keyserver hkp://keys.gnupg.net \
    --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
                7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.5.0 --gems=rails
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
sudo apt-add-repository -y ppa:rwky/redis
sudo apt-get update
sudo apt-get install redis-server

cd

sudo apt-add-repository 'deb http://www.rabbitmq.com/debian/ testing main'
curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -

# install rabbitmq
sudo apt-get update
sudo apt-get install rabbitmq-server

# start the rabbitmq serveer
sudo rabbitmq-plugins enable rabbitmq_management
sudo service rabbitmq-server restart

# download and install rabbitmqadmin
wget http://localhost:15672/cli/rabbitmqadmin
chmod +x rabbitmqadmin
sudo mv rabbitmqadmin /usr/local/sbin

sudo apt-get update
sudo apt-get install build-essential chrpath git-core libssl-dev libfontconfig1-dev

cd /usr/local/share
PHANTOMJS_VERISON=1.9.8
sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERISON-linux-x86_64.tar.bz2

sudo tar xjf phantomjs-$PHANTOMJS_VERISON-linux-x86_64.tar.bz2

sudo ln -s /usr/local/share/phantomjs-$PHANTOMJS_VERISON-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
sudo ln -s /usr/local/share/phantomjs-$PHANTOMJS_VERISON-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
sudo ln -s /usr/local/share/phantomjs-$PHANTOMJS_VERISON-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

cd

curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt-get install nodejs
sudo apt-get install imagemagick
mkdir code
cd code
git clone https://github.com/edwinvyp/exchange.git
cd exchange
apt install ruby-bundler
sudo apt-get install ruby-dev
bundle config build.digest-sha3 --with-cflags="-Wno-format-security"
bundle install
bin/init_config
