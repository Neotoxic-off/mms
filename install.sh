#!/bin/bash

install(){
    if [[ ! -f "/usr/bin/mms" ]]; then
        printf "Status..........: Installing\n"
        sudo chmod +x mms && sudo cp mms /usr/bin/
        if [[ -f "/usr/bin/mms" ]]; then
            printf "Status..........: Installed\n"
        else
            printf "Status..........: Not installed\n"
        fi
    else
        printf "Status..........: Installed\n"
    fi
    }

install
