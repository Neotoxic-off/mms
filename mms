#!/usr/bin/python3
# Author Neo
# Official repository:
# https://github.com/Neotoxic-off/mms/

import os
import sys

black = "\033[30m"
red = "\033[31m"
green = "\033[32m"
yellow = "\033[33m"
blue = "\033[34m"
cyan = "\033[36m"
grey = "\033[39m"

version = "1.1.0"

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
    f.write("NRM		=	\e[0m\nNRED	=	\e[31m\nNGRN	=	\e[32m\nNYEL	=	\e[33m\nNCYN	=	\e[36m\nBRED	=	\e[1;31m\nBGRN	=	\e[1;32m\nBYEL	=	\e[1;33m\nBCYN	=	\e[1;36m\n\n## CONFIGURATION\n\nSRC		=	" + src + "\n" + "BIN		=	" + out + "\n" + "CMP		=	gcc\nFLAGS	=	-g -Wall --extra\nLIB	=	" + lib + "\n")
    f.write("\nall: NAME clean\n\n")

    f.write("infos:\n")
    f.write("	@echo \"$(NRM)Source..........: $(BCYN) $(SRC) $(NRM)\"\n")
    f.write("	@echo \"$(NRM)Binary..........: $(BCYN) $(BIN) $(NRM)\"\n")
    f.write("	@echo \"$(NRM)Lib.............: $(BCYN) $(LIB) $(NRM)\"\n")
    f.write("	@echo \"$(NRM)Compiler........: $(BCYN) $(CMP) $(NRM)\"\n")
    f.write("	@echo \"$(NRM)Flags...........: $(BCYN) $(FLAGS) $(NRM)\"\n")
    f.write("NAME: infos\n")
    f.write("	@echo \"$(NRM)Status..........: $(BGRN) Compiling $(NRM)\"\n")
    f.write("	@echo \"$(NRM)Status..........: $(BYEL) Starting logs $(NRM)\"\n")
    f.write("	@make -C $(LIB)\n")
    f.write("	@cp $(LIB)/include/* ./include\n")
    f.write("	@$(CMP) -o $(BIN) $(SRC) -L $(LIB)/*.a $(FLAGS)\n")
    f.write("	@echo \"$(NRM)Status..........: $(BYEL) Logs ended $(NRM)\"\n")
    f.write("	@if [ -e \"$(BIN)\" ]; then echo \"$(NRM)Status..........: $(BGRN) Compiled $(NRM)\"; else echo \"$(NRM)Status..........: $(BRED) Failed $(NRM)\"; fi\n")
    f.write("clean:\n")
    f.write("	@echo \"$(NRM)Status..........: $(BGRN) Cleanning $(NRM)\"\n")
    f.write("	@find -name \"*.o\" -delete -o -name -delete\n")
    f.write("	@echo \"$(NRM)Status..........: $(BGRN) Cleanned $(NRM)\"\n")
    f.write("fclean:\n")
    f.write("	@echo \"$(NRM)Status..........: $(BGRN) Cleanning $(NRM)\"\n")
    f.write("	@rm -f $(BIN)\n")
    f.write("	@find -name \"*.a\" -delete -o -name -delete\n")
    f.write("	@echo \"$(NRM)Status..........: $(BGRN) Cleanned $(NRM)\"\n")
    f.write("re: fclean all\n")
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
