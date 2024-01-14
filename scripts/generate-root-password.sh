#!/bin/bash

function get_random_password()
{
    local password=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c8)
    echo "$password"
}

# $1 - key
# $2 - value
# $3 - .env file path
function set_env_variable()
{
    [ -z "$1" ] && (echo "Need key param"; exit 1);
    [ -z "$2" ] && (echo "Need value param"; exit 1);
    [ -z "$3" ] && (echo "Need .env file path param"; exit 1);
    sed -i "/^$1=/s/=.*/=$2/" "$3"
}

function main()
{
    local password=$(get_random_password)
    set_env_variable "ROOT_PASSWORD" "$password" ".env"
    echo "Generated root password is: $password"
}

main