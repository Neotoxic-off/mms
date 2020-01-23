#!/bin/bash

install(){
    if [[ ! -f "/usr/bin/mms" ]]; then
        printf "Status..........: Installing\n"
        sudo chmod +x mms && sudo cp mms /usr/bin/
        if [[ -f "/usr/bin/mms" ]]; then
            printf "Status..........: Installed\n"
            printf "Path..........: /usr/bin/mms\n"
        else
            printf "Status..........: Not installed\n"
        fi
    else
        printf "Status..........: Installed\n"
        printf "Path..........: /usr/bin/mms\n"
        printf "Do you want to update [y/n]\n"
        printf "Choice..........: "
        read update
        if [[ $update == "y" ]]; then
            sudo rm /usr/bin/mms
            sudo chmod +x mms && sudo cp mms /usr/bin/
            install
        fi
    fi
    }

install
