##    '' indicates not to take backup

sed -i '' '57s/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
