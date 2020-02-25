#!/bin/bash
yum -y install httpd jq
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

adduser app -p app

echo "export DB_USERNAME=$(aws ssm get-parameter --name="${username_key}" --region="${region}" --with-decryption | jq '.Parameter.Value')" >> /home/app/.bashrc
echo "export DB_PASSWORD=$(aws ssm get-parameter --name="${password_key}" --region="${region}" --with-decryption | jq '.Parameter.Value')" >> /home/app/.bashrc

service httpd start
