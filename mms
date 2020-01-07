#!/usr/bin/python3

import os
import sys

black = "\033[30m"
red = "\033[31m"
green = "\033[32m"
yellow = "\033[33m"
blue = "\033[34m"
cyan = "\033[36m"
grey = "\033[39m"

action = " ~> "
message = "==> "

year = "2019"

def checker():
    print(yellow + message + grey + "Checking folders")
    if os.path.exists("include"):
        print(yellow + message + grey + "Include folder found")
    else:
        print(yellow + message + grey + "Include folder not found")
        print(red + action + grey + "Generating folder")
        os.mkdir("include")

def helpme():
    print("\tUsage:")
    print("\t\tHOMEMODE ==> mms <Source.c> <Output> <Lib_Path>")
    print("\t\tLIBMODE  ==> mms <Lib_Path> <Lib_name>")

def homemode():
    src = sys.argv[1]
    out = sys.argv[2]
    lib = sys.argv[3]
    liblen = len(lib)

    if lib[liblen - 1] != '/':
        lib = lib + '/'

    print(yellow + message + grey + "Checking files")
    if os.path.exists("Makefile"):
        print(red + action + grey + "Removing previous Makefile")
        os.remove("Makefile")

    print(red + message + red + "HOMEMODE" + grey + " has been detected")
    print(red + action + grey + "Generating the Makefile")
    f = open("Makefile", "x")
    f.write("##\n## EPITECH PROJECT, " + year + "\n## Generated with mms\n## File description:\n## Makefile\n##\n\n")
    f.write("SRC	=	" + src + "\n")
    f.write("NAME	=	" + out + "\n\n")
    f.write("all: NAME clean\nNAME:\n\n")
    f.write("	@make -C " + lib + "\n")
    f.write("	@cp " + lib + "/include/* ./include\n")
    f.write("	@gcc -o $(NAME) $(SRC) " + lib + "*.a -g\n")
    f.write("clean:\n\n")
    f.write("	@find -name \"*.o\" -delete -o -name -delete\n")
    f.write("fclean: clean\n\n")
    f.write("	@rm -f $(NAME)\n\n")
    f.write("re: fclean all\n\n")
    f.close()

def libmode():
    lib = sys.argv[1]
    libname = sys.argv[2]
    liblen = len(lib)

    if lib[liblen - 1] != '/':
        lib = lib + '/'

    print(yellow + message + grey + "Checking files")
    if os.path.exists(lib + "Makefile"):
        print(red + action + grey + "Removing previous Makefile")
        os.remove(lib + "Makefile")
    if os.path.exists(lib + "include"):
        print(yellow + message + grey + "Include folder found")
    else:
        print(yellow + message + grey + "Include folder not found")
        print(red + action + grey + "Generating folder")
        os.mkdir(lib + "include")

    print(yellow + message + red + "LIBMODE" + grey + " has been detected")
    print(red + action + grey + "Generating the Makefile")
    f = open(lib + "Makefile", "x")
    f.write("##\n## EPITECH PROJECT, " + year + "\n## Generated with mms\n## File description:\n## Makefile\n##\n\n")
    f.write("SRC	= *.c\n")
    f.write("all: build\n")
    f.write("	@echo \"\e[39m[\e[33m  ####  \e[39m]\e[33m Copying the lib\e[39m\"\n")
    f.write("	@cp *.a ./include/\n")
    f.write("	@cp *.h ./include/\n")
    f.write("build:\n")
    f.write("	@echo \"\e[39m[\e[33m  ####  \e[39m]\e[33m building\"\n")
    f.write("	@gcc -c $(SRC) -g -I ./include/\n")
    f.write("	@ar rc " + libname + ".a " + " *.o\n")
    f.write("clean:\n")
    f.write("	@echo \"\e[39m[\e[33m  ####  \e[39m]\e[33m cleanning *.o\e[39m\"\n")
    f.write("	@find -name \"*.o\" -delete -o -name -delete")
    f.close()

def mms():
    print(yellow + action + grey + "Starting mms ...\n")

    if len(sys.argv) == 2 and sys.argv[1] == "-h":
        helpme()
        exit(0)
    else:
        checker()
        if len(sys.argv) == 4:
            homemode()
            if os.path.exists("Makefile"):
                print(yellow + message + grey + "Makefile successfully generated")
            else:
                print(yellow + message + grey + "Unknown error can't find the Makefile")
        elif len(sys.argv) == 3:
            libmode()
            if os.path.exists("Makefile"):
                print(yellow + message + grey + "Makefile successfully generated")
            else:
                print(yellow + message + grey + "Unknown error can't find the Makefile")
        else:
            print(red + message + grey + "Missing argument ...")
mms()
