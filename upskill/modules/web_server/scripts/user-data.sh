#!/bin/bash

my_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')

cat > index.html <<EOF
<h1>EC2 user data</h1>
<p>MY IP: ${my_ip}</p>
EOF

nohup busybox httpd -f -p ${server_port} &
