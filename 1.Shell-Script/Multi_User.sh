#!/bin/bash

if [ $# -gt 0 ]; then
    for USERNAME in "$@"; do
        EXISTING_USER=$(grep -i -w "^${USERNAME}:" /etc/passwd | cut -d ':' -f 1)
        if [ "${USERNAME}" = "${EXISTING_USER}" ]; then
            echo "The User '${USERNAME}' Already Exists."
        else
            echo "Let's Create The user '${USERNAME}'."
            sudo useradd -m -s /bin/bash "${USERNAME}"
            sudo usermod -aG sudo "${USERNAME}"
            echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers > /dev/null
            SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
            PASSWORD="India@${RANDOM}${SPEC}"
            echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
            sudo passwd -e "${USERNAME}"
            echo "The Temporary Credentials for ${USERNAME} are: ${PASSWORD}"
        fi
    done
else
    echo "Provide Valid Argument."
fi

