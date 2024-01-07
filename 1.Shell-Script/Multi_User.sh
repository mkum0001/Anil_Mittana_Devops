#!/bin/bash
SLACK_WEB=https://hooks.slack.com/services/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
if [ $# -gt 0 ]; then
    for USERNAME in $@; do
          
        EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f 1)
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
            curl -X POST ${SLACK_WEB} -sL -H 'Content-type: application/json' --data "{"text": \"Username is: ${USERNAME}\"}" >>/dev/null
            curl -X POST ${SLACK_WEB} -sL -H 'Content-type: application/json' --data "{"text": \"Temporary Password Is: ${PASSWORD}  Reset This Password Immediatly.\"}" >>/dev/null

        fi
    done
else
    echo "Provide Valid Argument."
fi

