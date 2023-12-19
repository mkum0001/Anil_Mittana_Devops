#!/bin/bash
set +x
if [ $# -gt 0 ]; then
    for username in $@; do
        existing_user=$(cat /etc/passwd | grep -i -w ${username} | cut -d ":" -f 1)
        if [ "${username}" = "${existing_user}" ]; then
            echo "the user ${username} exists"
        else
            echo "lets create user"
            sudo useradd -m ${username} --shell /bin/bash
            sudo usermod -aG sudo ${username}
            echo '${username} ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
            spec=$(echo '!@#$%^&*()_' | fold -1 | shuf | head -1)
            password=India@${RANDOM}${spec}
            echo ${username}:${password} | sudo chpasswd
            passwd -e ${username}
            echo "the password for ${username} is ${password}"
        fi

    done
else
    echo "provide username"
fi
