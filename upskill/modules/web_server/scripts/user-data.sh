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

service httpd start
