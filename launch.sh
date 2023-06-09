#!/bin/bash

# Author: Diego Vargas (f1rul4yx)

# Colors
negrita="\033[1m"
subrayado="\033[4m"
negro="\033[30m"
rojo="\033[31m"
verde="\033[32m"
amarillo="\033[33m"
azul="\033[34m"
magenta="\033[35m"
cian="\033[36m"
blanco="\033[37m"
reset="\033[0m"

# Functions
function root_verification() {
    clear
    if [ "$EUID" -ne 0 ]; then
        echo -e "\n${negrita}${rojo}Este script debe ser ejecutado como usuario root${reset}"
        exit 1
    fi
}
function username() {
    clear
    echo -e "\n${negrita}Escribe tu nombre de usuario perfectamente:${reset} \c"
    read username
    clear
}
function question() {
    clear
    read answer
    clear
}
function search() {
    clear
    echo "" | xclip -selection clipboard
    base64 -d encrypted_file | grep "${answer}" | xclip -selection clipboard
    clear
}
function erased() {
    clear
    sudo echo "" > /home/${username}/.bash_history &>/dev/null
    sudo echo "" > /home/${username}/.zsh_history &>/dev/null
    sudo echo "" > ~/.bash_history &>/dev/null
    sudo echo "" > ~/.zsh_history &>/dev/null
    clear
}

# Program
root_verification
username
while true; do
    question
    search
    erased
done
