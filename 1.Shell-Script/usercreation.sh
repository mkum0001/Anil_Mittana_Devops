#/bin/bash
set -x
if [ $# -gt 0 ]; then
USERNAME=$1
Existing_User=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f 1)
if [ "${USERNAME}" = "${Existing_User}" ]; then
echo 'user with a name ${Username} already exists'
else
echo ' create the user '
useradd -m -s /bin/bash "$USERNAME"
# Add user to sudoers
sudo usermod -aG sudo "$USERNAME"
echo '${USERNAME} ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
SPEC=$(echo '!@#$%^&*()' | fold -w1 | shuf | head -1)
PASSWORD="INDIA@${RANDOM}${SPEC}"
echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
PASSWORD -e "$USERNAME"
echo " The username and password are ${USERNAME} and ${PASSWORD} "
fi
else
echo "provide valid args"
fi