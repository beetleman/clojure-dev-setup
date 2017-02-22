##!/usr/bin/env bash

apt-get update
apt-get install git build-essential -y

echo "INSTALL SASSC"
cd /usr/local/lib/
git clone https://github.com/sass/sassc.git --branch 3.2.1 --depth 1
git clone https://github.com/sass/libsass.git --branch 3.2.1 --depth 1

echo 'SASS_LIBSASS_PATH="/usr/local/lib/libsass"' >> /etc/environment
# Flush the changes…
source /etc/environment
# Make sure it worked…
echo $SASS_LIBSASS_PATH
# Now you can make SassC…
cd /usr/local/lib/sassc/
make

cd /usr/local/lib/sassc/
SASS_LIBSASS_PATH="/usr/local/lib/libsass" make

cd /usr/local/bin/
ln -s ../lib/sassc/bin/sassc sassc

echo "INSTALL PHANTOMJS"

VERSION=2.1.1

cd /usr/local/share
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${VERSION}-linux-x86_64.tar.bz2
tar xjf phantomjs-${VERSION}-linux-x86_64.tar.bz2
ln -s /usr/local/share/phantomjs-${VERSION}-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

rm phantomjs-${VERSION}-linux-x86_64.tar.bz2


apt-get remove git build-essential -y
