#!/bin/bash

function mms
{
    source="./$1/Makefile";
    list="./$1/list"

    if [[ -f "./$1/Makefile" ]]; then
        printf "\e[39m[\e[33m .. \e[39m]\e[36m cleanning files\e[39m\n"
        rm ./$1/Makefile
    fi

    printf "##\n## EPITECH PROJECT, 2019\n## makemesmile\n## File description:\n## Makefile\n##\n\n" >> $source
    echo "all: build" >> $source
    echo "	@echo \"\e[39m[\e[33m CP \e[39m]\e[36m copying files\e[39m\"" >> $source
    echo "	@cp *.a ../" >> $source
    echo "	@cp *.h ../../include/" >> $source
    echo "build:" >> $source
    echo "	@echo \"\e[39m[\e[33m BD \e[39m]\e[36m building\"" >> $source
    find -name "*.c" > $list
    while IFS= read -r line
    do
        echo "	@gcc -c $line -g -I ../../include/ -Werror -Wfatal-errors" >> $source
        echo "	@echo \"\e[39m[\e[32mDONE\e[39m]\e[36m $line\e[39m\"" >> $source
    done < "$list"
    echo "	@ar rc libmy.a *.o" >> $source
    echo "clean:" >> $source
    echo "	@echo \"\e[39m[\e[33m clean \e[39m]\e[36m\"" >> $source
    echo "	@find -name \"*.c\"" >> $source

    if [[ -f "./$1/Makefile" ]]; then
        printf "\e[39m[\e[32m OK \e[39m]\e[36m all done\e[39m\n"
    fi
}

main()
{
    if [[ -z $1 ]]; then
        printf "\e[39m[\e[31mFAIL\e[39m]\e[36m Bad argument\e[39m\n"
        exit
    fi

    mms $1
}

main $1
