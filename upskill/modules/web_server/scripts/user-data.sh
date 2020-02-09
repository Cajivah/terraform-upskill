#!/bin/bash
yum -y install httpd
local_ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

cat > /var/www/html/index.html <<EOF
<html>
<head></head>
<body>
<h1>EC2 metadata</h1>
<p>Local IPv4: $local_ip</p>
</body>
</html>
EOF

mkdir /var/www/html/app
ln -d /var/www/html/index.html /var/www/html/app/index.html

chmod 0755 -R /var/www/html

echo "export DB_USERNAME=$(aws get-parameter --name="${username_key}")" >> ~/.bashrc
echo "export DB_PASSWORD=$(aws get-parameter --name="${password_key}")" >> ~/.bashrc

service httpd start
