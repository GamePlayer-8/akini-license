#!/bin/sh

cp /etc/ssl/certs/ca-certificates.crt /

apk add --no-cache markdown > /dev/null
cd /source

echo '<!DOCTYPE html>' > index.html
echo '<html lang="en-US">' >> index.html
cat docs/head.html >> index.html

echo '<body>' >> index.html
echo '<div>' >> index.html
markdown README.md >> index.html
echo '</div>' >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html

mkdir -v /runner/page/
cp -rv /source/* /runner/page/
