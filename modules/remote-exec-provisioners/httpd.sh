
#!/bin/bash

sudo apt-get update
sudo apt-get install -y yum

yum install -y httpd
service httpd start
chkconfig httpd on
echo "<h1>Hello world - Bari Allali</h1>" > /var/www/html/index.html







#END





#END