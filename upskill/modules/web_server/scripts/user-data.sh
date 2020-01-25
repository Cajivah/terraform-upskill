#!/bin/bash

local_ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

cat > index.html <<EOF
<h1>EC2 metadata</h1>
<p>Local IPv4: $local_ip</p>
EOF

nohup busybox httpd -f -p ${server_port} &
