#!/bin/bash

# $1 - registration token
# $2 - gitlab instance url
# $3 - runner name
function register_runner
{
    [ -z "$1" ] && (echo "Need registration token param"; exit 1);
    [ -z "$2" ] && (echo "Need gitlab instance url param"; exit 1);
    [ -z "$3" ] && (echo "Need runner name param"; exit 1);
    docker compose exec -it gitlab-runner-1 \
        gitlab-runner register \
        --non-interactive \
        --registration-token "$1" \
        --locked=false \
        --description "$3" \
        --url "$2" \
        --executor docker \
        --docker-image 'alpine:3.19' \
        --docker-network-mode 'host'
}

# $1 - prompt
# $2 - suggested input
function read_input
{
    read -e -p "$1" -i "$2" input
    echo "$input"
}

function main
{
    local token=$(read_input "Enter registration token: " "")
    local url=$(read_input "Enter GitLab instance url: " "http://gitlab.test.local")
    local name=$(read_input "Enter runner name: " "runner-1")

    register_runner "$token" "$url" "$name"

    [ $? -eq 0 ] && echo "Successfully registered runner '$name'" || echo "Something failed ..."
}

main