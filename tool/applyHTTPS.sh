#! /bin/bash
PWD=$(pwd)
SOURCE="${BASH_SOURCE[0]}"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
source $DIR/../common/bootstrap.sh NORUBY NOPYTHON

cd /tmp
status_exec wget https://dl.eff.org/certbot-auto
status_exec chmod u+x /tmp/certbot-auto
echo "Applying cert for [$@]"
sudo /tmp/certbot-auto certonly --webroot \
        --webroot-path=/var/nginx/www \
	$@ # -d domain1 -d domain2
