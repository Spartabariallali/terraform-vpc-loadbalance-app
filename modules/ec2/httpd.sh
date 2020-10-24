 #!/bin/bash
 
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo bash -c 'Bari Allali - Terraform > /var/www/html/index.html'


EOF