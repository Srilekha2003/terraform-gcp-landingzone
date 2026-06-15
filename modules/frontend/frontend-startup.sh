#!/bin/bash

apt-get update

apt-get install apache2 -y

systemctl enable apache2

systemctl start apache2

cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>Terraform Landing Zone</title>
</head>
<body>
<h1>Frontend VM Created Using Terraform</h1>
<h2>Owner: Srilekha</h2>
<h3>Three Tier Architecture Demo</h3>
</body>
</html>
EOF